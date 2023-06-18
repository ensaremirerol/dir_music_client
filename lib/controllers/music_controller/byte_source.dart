import 'package:just_audio/just_audio.dart';

import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../../models/stream/byte_stream_model.dart';
import '../../services/api_service/calls/stream/stream_api_call.dart';

class BytesSource extends StreamAudioSource {
  final int id;
  BytesSource(this.id) : super(tag: id.toString());

  final _apiService = InstanceController().getByType<ApiService>();

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    final response = await _apiService.call(const StreamApiCall(),
        StreamApiCallArgs(rangeStart: start, rangeEnd: end, id: id.toString()));

    if (response.error_code != null) {
      throw Exception('Error while requesting audio stream');
    }

    final ByteStreamModel data = response.data!;

    final List<int> bytes = [];
    bytes.addAll(data.bytes);
    return StreamAudioResponse(
      sourceLength: data.contentLength,
      contentLength: (end ?? data.contentLength) - (start ?? 0),
      offset: start ?? 0,
      stream: Stream.value(bytes),
      contentType: 'audio/mpeg',
    );
  }
}

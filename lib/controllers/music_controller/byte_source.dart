import 'package:just_audio/just_audio.dart';

import '../../core/services/api_service/api_service.dart';
import '../../core/utils/instance_controller.dart';
import '../../services/api_service/calls/stream/stream_api_call.dart';

class BytesSource extends StreamAudioSource {
  final int id;
  final int length;
  BytesSource(this.id, this.length) : super(tag: 'MyAudioSource');

  final _apiService = InstanceController().getByType<ApiService>();

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    final response = await _apiService.call(
        const StreamApiCall(),
        StreamApiCallArgs(
            rangeStart: start ?? 0,
            rangeEnd: end ?? length - 1,
            id: id.toString()));

    if (response.error_code != null) {
      throw Exception('Error while requesting audio stream');
    }
    List<int> bytes = [];
    bytes.addAll(response.data!);
    return StreamAudioResponse(
        sourceLength: length - 1,
        contentLength: (end ?? length) - (start ?? 0),
        offset: start ?? 0,
        stream: Stream.value(bytes),
        contentType: 'audio/mpeg',
        rangeRequestsSupported: true);
  }
}

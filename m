Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 525BC718B3F
	for <lists.virtualization@lfdr.de>; Wed, 31 May 2023 22:34:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5285961489;
	Wed, 31 May 2023 20:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5285961489
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gootzen.net header.i=@gootzen.net header.a=rsa-sha256 header.s=aw2020113001 header.b=PQXjFINQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_Hr2blUBbx6; Wed, 31 May 2023 20:34:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 101AC61480;
	Wed, 31 May 2023 20:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 101AC61480
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05E71C0089;
	Wed, 31 May 2023 20:34:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 560CDC0037
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22DDD83EA9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22DDD83EA9
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gootzen.net header.i=@gootzen.net
 header.a=rsa-sha256 header.s=aw2020113001 header.b=PQXjFINQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cp8w7WehaSAQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:34:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1A883E5B
Received: from arg-plspam-c1n4.mailshover.nl (arg-plspam-c1n4.mailshover.nl
 [145.131.15.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE1A883E5B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:34:22 +0000 (UTC)
Received: from gw.mailshover.nl ([2001:678:76c:1:3996::58]
 helo=arg-plsmtp-c1n2.argewebhosting.nl)
 by arg-plspam-c1n4.mailshover.nl with esmtp (Exim 4.92)
 (envelope-from <peter-jan@gootzen.net>)
 id 1q4SWP-00A1Bc-Je; Wed, 31 May 2023 22:34:19 +0200
Received: from [192.168.2.77] (86-94-78-64.fixed.kpn.net [86.94.78.64])
 (Authenticated sender: peter-jan@gootzen.net)
 by arg-plsmtp-c1n2.argewebhosting.nl (Postfix) with ESMTPA id 19869205E318;
 Wed, 31 May 2023 22:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 arg-plsmtp-c1n2.argewebhosting.nl
 19869205E318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gootzen.net;
 s=aw2020113001; t=1685565256;
 bh=hqBdcqsFAy5xsdjZEufKFW4H7LIFMs6dcIgrXO+8BMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PQXjFINQe4lRjIHqoCFtODXgWe7BGPIwSfy4tF7ZwBRBRGH6RBia77e3Utwp/YWLE
 ewisQ+/j07QimTrmjemOWWpsVVY27LzuqMitlUBi1KrW+wLEl+ol+ujUFxhGnURSwY
 JD/q6BCV2sXEud3YUqV6ii8/19WUmS9YLDZ+Ut2ShecqqHvRO4ZHwBy/F1wAINDitq
 CQf4uGVj/muuSrfTTgRuFJrVbMGvVo3MUVNT9YFcXpUuwlgl/UnUSm8nsm+PYq6M5a
 kP8zlVaw76fE9yAL68FSTLv/JAs2ZSVHCRKP+Lcqgg5LrDWzJY4TwD8GuzeXZRCeA6
 dTZJ36SE7H3zw==
Message-ID: <02ad6a48-6db7-fab5-721e-2d940d4a664a@gootzen.net>
Date: Wed, 31 May 2023 22:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH V2] virtio-fs: Improved request latencies when Virtio
 queue is full
Content-Language: en-US
To: Vivek Goyal <vgoyal@redhat.com>
References: <20230531171031.1424338-1-peter-jan@gootzen.net>
 <ZHedgNu89LoiW4sZ@redhat.com>
In-Reply-To: <ZHedgNu89LoiW4sZ@redhat.com>
X-Originating-IP: 2001:678:76c:1:3996::58
X-SpamExperts-Domain: out.mailshover.nl
X-SpamExperts-Username: 2001:678:76c:1:3996::58
Authentication-Results: mailshover.nl; auth=pass
 smtp.auth=2001:678:76c:1:3996::58@out.mailshover.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.50)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT90jVzTLJt3vj6cAu5S4eQ0PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xzOoHxWscew68UvLJqW/V1opzyoDuAP4C0aaz3STa5zA+i
 +LgxjoYkXCbk6qYg3TLiBCq0YCJmjpNMbRTU3wgrC0Y3u/qphs34dTesYrpa6tiW8BKfyIS6EHTV
 hG8std+lEPHKAzuJoUDzV774tvkniFloh3x3CR4Jb2gWRrpPKFFqxySg9i57HiKhJ4jLzBCouJYi
 QWxaMB85XLIGw32ggM1FjTV5UXzaWZFiY/IuWRLx/Du65BKz/oEcyvz1uhV1UWVvvdkzh9/Seh7h
 SLJU1ktV7ekmGpxaAJ/k28IIq/fPjylt/HZ8k1j7Ut/7PLaLZ91wKz2db1Hju8P5FD5V7Ogv5mRk
 S/8bWrZGatZmbSSp6wqBiWgCUvpQC7hp792Kjeyl92hTDJK+4O0vOmkQc1UkGqjsciyILerEw8FX
 FnC9J8Tfx0FDPUDJU5K58QZrH/iEgzfzmnMXBIwMoePog2OkM5zMbrn2rUwXJSugd8VmzzAQ6gJW
 hVbNViZCOWKRNtlfJySsZ2eS9qGTagUdlCnL4IjEaJi/Te03jgZkrrEp5+1QCuHCTUw0ggLUf54P
 bqpDL7OvFc18bWQRihVmn+UCB3F67PeP7Iep2w5lJ/gPneWh5kublaxZVQoA47wpOMQJvQ/Ck3ii
 U+4DQAj3DhYpgwxEDQuH7GNpv2Hu1lWbvKBSWz9JL+ncH+8owBXh81G7jrpdN7mVSzj08dE/wSOF
 xK3x2nWIPJ9uBAHpGM6yVlXos6U6uiVTpLoJ72SRq3oTg7MWD+ZQoaUmN03jRfRyWTWs40tiYHh/
 OVIkQNEvdUolNl0YNdMUajomuQYN/2oiLQnPnhxk6tgp0mibbPhjo3exrvNYlwUjtixib2avL+YD
 c2YHUzAZPzd03lfeLwwWMKXDYWRmRiEAGsmgZ2dSHWe6ZqFzQSoICK6h1lz1pRXWhjh9fdbl44I0
 Df3UANye5mij+Mqql8NZoGGE1H07YtaUHC2h22rHSV+m0L6jX0Is2t8eEL3ZqG06ZzoMifa29zXh
 hznXry6IqJnerLfiFNb0FFyRjT8NmcTq0ZsK3TexxWxyube0LJjGSj+jnQa75Jum1feMIVfUDmU/
 w0m9OyPDekvkd3BNWiTFSFOlxsY77ASAZB1sLAji3Opi4pBglvBqtTQxJduSkSzRv5CQHId5vY1x
 DTpc1F/nsvY4ocfmWv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@arg-plspam-c1n0.mailshover.nl
Cc: miklos@szeredi.hu, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Peter-Jan Gootzen via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Peter-Jan Gootzen <peter-jan@gootzen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 31/05/2023 21:18, Vivek Goyal wrote:
> On Wed, May 31, 2023 at 07:10:32PM +0200, Peter-Jan Gootzen wrote:
>> When the Virtio queue is full, a work item is scheduled
>> to execute in 1ms that retries adding the request to the queue.
>> This is a large amount of time on the scale on which a
>> virtio-fs device can operate. When using a DPU this is around
>> 40us baseline without going to a remote server (4k, QD=1).
>> This patch queues requests when the Virtio queue is full,
>> and when a completed request is taken off, immediately fills
>> it back up with queued requests.
>>
>> This reduces the 99.9th percentile latencies in our tests by
>> 60x and slightly increases the overall throughput, when using a
>> queue depth 2x the size of the Virtio queue size, with a
>> DPU-powered virtio-fs device.
>>
>> Signed-off-by: Peter-Jan Gootzen <peter-jan@gootzen.net>
>> ---
>> V1 -> V2: Not scheduling dispatch work anymore when not needed
>> and changed delayed_work structs to work_struct structs
>>
>>  fs/fuse/virtio_fs.c | 32 +++++++++++++++++---------------
>>  1 file changed, 17 insertions(+), 15 deletions(-)
>>
>> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
>> index 4d8d4f16c727..a676297db09b 100644
>> --- a/fs/fuse/virtio_fs.c
>> +++ b/fs/fuse/virtio_fs.c
>> @@ -45,7 +45,7 @@ struct virtio_fs_vq {
>>  	struct work_struct done_work;
>>  	struct list_head queued_reqs;
>>  	struct list_head end_reqs;	/* End these requests */
>> -	struct delayed_work dispatch_work;
>> +	struct work_struct dispatch_work;
>>  	struct fuse_dev *fud;
>>  	bool connected;
>>  	long in_flight;
>> @@ -202,7 +202,7 @@ static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
>>  	}
>>  
>>  	flush_work(&fsvq->done_work);
>> -	flush_delayed_work(&fsvq->dispatch_work);
>> +	flush_work(&fsvq->dispatch_work);
>>  }
>>  
>>  static void virtio_fs_drain_all_queues_locked(struct virtio_fs *fs)
>> @@ -346,6 +346,9 @@ static void virtio_fs_hiprio_done_work(struct work_struct *work)
>>  			dec_in_flight_req(fsvq);
>>  		}
>>  	} while (!virtqueue_enable_cb(vq) && likely(!virtqueue_is_broken(vq)));
>> +
>> +	if (!list_empty(&fsvq->queued_reqs))
>> +		schedule_work(&fsvq->dispatch_work);
>>  	spin_unlock(&fsvq->lock);
>>  }
>>  
>> @@ -353,7 +356,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
>>  {
>>  	struct fuse_req *req;
>>  	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
>> -						 dispatch_work.work);
>> +						 dispatch_work);
>>  	int ret;
>>  
>>  	pr_debug("virtio-fs: worker %s called.\n", __func__);
>> @@ -388,8 +391,6 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
>>  			if (ret == -ENOMEM || ret == -ENOSPC) {
>>  				spin_lock(&fsvq->lock);
>>  				list_add_tail(&req->list, &fsvq->queued_reqs);
>> -				schedule_delayed_work(&fsvq->dispatch_work,
>> -						      msecs_to_jiffies(1));
> 
> Virtqueue being full is only one of the reasons for failure to queue
> the request. What if virtqueue is empty but we could not queue the
> request because lack of memory (-ENOMEM). In that case we will queue
> the request and it might not be dispatched because there is no completion.
> (Assume there is no further new request coming). That means deadlock?
> 
> Thanks
> Vivek
> 

Good catch that will deadlock.

Is default kernel behavior to indefinitely retry a file system
request until memory is available?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

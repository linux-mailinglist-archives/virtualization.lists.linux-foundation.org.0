Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77D422C3D
	for <lists.virtualization@lfdr.de>; Tue,  5 Oct 2021 17:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAC4A60AF5;
	Tue,  5 Oct 2021 15:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qv02DajTBynk; Tue,  5 Oct 2021 15:20:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BAA4E60786;
	Tue,  5 Oct 2021 15:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57193C001E;
	Tue,  5 Oct 2021 15:20:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1E98C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 15:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C107240481
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 15:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYnQqFDpuudW
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 15:20:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C1A740524
 for <virtualization@lists.linux-foundation.org>;
 Tue,  5 Oct 2021 15:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633447253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uacToDR1I0FxC1x9xJ+CimJRSu2bmxQDudmiV7tnB4E=;
 b=dTpz3ZE05Niejs1Gd8wr/7HzCIKzlrRH92xZh9hp43Vh1tGROT1G0IL82A9AHFFbhvwl9W
 TTfudo/3AcDtpt8+IOvpNF/di+b/QYAo8zCBu66UfLlIXpVr8NNC7va6t0SjvUAfBmENLE
 ZgHQI72bBEIXctv27+hPeGPft53ibzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-ZrHkHQnuPmuuqSH62acTrQ-1; Tue, 05 Oct 2021 11:20:49 -0400
X-MC-Unique: ZrHkHQnuPmuuqSH62acTrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529B81084683;
 Tue,  5 Oct 2021 15:20:48 +0000 (UTC)
Received: from localhost (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D8360BF4;
 Tue,  5 Oct 2021 15:20:30 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [virtio-dev] Re: [RFC PATCH 1/1] virtio: write back features
 before verify
In-Reply-To: <20211005072110-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
References: <20211003070030.658fc94e.pasic@linux.ibm.com>
 <20211003021027-mutt-send-email-mst@kernel.org>
 <20211003032253-mutt-send-email-mst@kernel.org>
 <87ee912e45.fsf@redhat.com>
 <20211004083455-mutt-send-email-mst@kernel.org>
 <878rz83lx0.fsf@redhat.com>
 <20211004110152-mutt-send-email-mst@kernel.org>
 <87zgro23r1.fsf@redhat.com>
 <20211004160005-mutt-send-email-mst@kernel.org>
 <20211005131751.53175b10.pasic@linux.ibm.com>
 <20211005072110-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 05 Oct 2021 17:20:29 +0200
Message-ID: <87fstf1osi.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-s390@vger.kernel.org, markver@us.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, virtio-dev@lists.oasis-open.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Oct 05 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Oct 05, 2021 at 01:17:51PM +0200, Halil Pasic wrote:
>> On Mon, 4 Oct 2021 16:01:12 -0400
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> 
>> > > 
>> > > Ok, so what about something like
>> > > 
>> > > "If FEATURES_OK is not set, the driver MAY change the set of features it
>> > > accepts."
>> > > 
>> > > in the device initialization section?  
>> > 
>> > Maybe "as long as". However Halil implied that some features are not
>> > turned off properly if that happens. Halil could you pls provide
>> > some examples?
>> 
>> 
>> 
>> static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>> {
>> ...
>>     if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
>>         qapi_event_send_failover_negotiated(n->netclient_name);
>>         qatomic_set(&n->failover_primary_hidden, false);
>>         failover_add_primary(n, &err);
>>         if (err) {
>>             warn_report_err(err);
>>         }
>>     }
>> }
>> 
>> This is probably the only one in QEMU. Back then I stopped looking
>> after the first hit.

After some grepping, I agree that this seems to be the only one.

>> 
>> Regards,
>> Halil
>
> Hmm ok more failover issues :(
> This stuff really should be moved to set_status.

Yes, F_STANDBY does not exist for legacy, so performing those actions
when FEATURES_OK is set looks like the right thing to do.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F7319B02
	for <lists.virtualization@lfdr.de>; Fri, 12 Feb 2021 09:08:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 845B66F64A
	for <lists.virtualization@lfdr.de>; Fri, 12 Feb 2021 08:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCKXQ_LDuGfj for <lists.virtualization@lfdr.de>;
	Fri, 12 Feb 2021 08:08:12 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 7F2926F613; Fri, 12 Feb 2021 08:08:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 116226F49B;
	Fri, 12 Feb 2021 08:08:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C86EFC013A;
	Fri, 12 Feb 2021 08:08:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65925C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 08:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A4138755C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 08:08:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Coh6Atff1fg8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 08:08:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2B52887557
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613117281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e91sBuS2eUt5U/U4RuQCZfbUWRB/D2S94vtMrUqV2is=;
 b=HBd518FOjfQ3gz8LetFZeOefAbaI7fHDzCMHXTBzciiJM6nOWdqgORNauS/Ym35EV1ElZ2
 mlb+gkZnnJUAeNhUxg7LvH6agfPcQpjUPTqzNBQcKz4tukKWSDnTBz71DTjLyfo9/aWZn3
 CpFuRg+kJrDt42sgMO4OapOeV9vvSM0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-XJp6aCbUONGyNdPiOFHNgg-1; Fri, 12 Feb 2021 03:08:00 -0500
X-MC-Unique: XJp6aCbUONGyNdPiOFHNgg-1
Received: by mail-ed1-f70.google.com with SMTP id x13so6277503edi.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Feb 2021 00:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e91sBuS2eUt5U/U4RuQCZfbUWRB/D2S94vtMrUqV2is=;
 b=itkJE3N9oO5NA81DovabcUeXpgRZvrUUOF3x5+IRVr9ZdD/LO7NneBR0YCv57b+GO9
 g6TeC2+4o6eJnJPZtTn+I8Klz4moBJZundTya7aQOrv2JVUnrtH7Hl9WUWyMTvfIHPZA
 eiinz4kceARKCD4NOuOGsBQ9THJSV0bLJUkeNguUrGToQUmo0vp7/tszRxRBhkJKTKX5
 lkOaflCeyuLmrpfaCY3dPk8khE7Z6p0Ucee9RzPeMlCjyIMoDbd87FsH0mofLPhaetkw
 YA1KNVesyw5/QADX0Aw716geosg5CJ6YlEZyfouzK3KKrCMLuXWzXGlVsXgIUwvPPfY+
 +UxQ==
X-Gm-Message-State: AOAM532E9FKebw0YOoflNjcRW/SQTtvIFgqbo8qDYamyGLGku0qLzZQ+
 gyzfYwpiqsSrG4zrUj+19u6qnduMMPZrEN+8CeZCG6/eq8QsqigaNJHzsO+2bqiIp/kxnWvr5Yq
 DDhA0TfdR4iZIIACro6kMdtvfUv3oAZL5QzaeGHFNOw==
X-Received: by 2002:a17:906:b19a:: with SMTP id
 w26mr1837742ejy.296.1613117278891; 
 Fri, 12 Feb 2021 00:07:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4UZHOM3MECOyqyoo31l+Ya9+PmIMzipGRc9pjPxWBn6h9u4zDZXf7FXG0XDCU+qiqPKdNxg==
X-Received: by 2002:a17:906:b19a:: with SMTP id
 w26mr1837718ejy.296.1613117278668; 
 Fri, 12 Feb 2021 00:07:58 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id cn18sm5361167edb.66.2021.02.12.00.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 00:07:58 -0800 (PST)
Date: Fri, 12 Feb 2021 09:07:55 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v4 00/17] virtio/vsock: introduce SOCK_SEQPACKET
 support
Message-ID: <20210212080755.ajip7s7dhmxqhxqd@steredhat>
References: <20210207151259.803917-1-arseny.krasnov@kaspersky.com>
 <20210207111954-mutt-send-email-mst@kernel.org>
 <8bd3789c-8df1-4383-f233-b4b854b30970@kaspersky.com>
 <20210211145701.qikgx5czosdwx3mm@steredhat>
 <10aa4548-2455-295d-c993-30f25fba15f2@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <10aa4548-2455-295d-c993-30f25fba15f2@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "stsp2@yandex.ru" <stsp2@yandex.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "oxffffaa@gmail.com" <oxffffaa@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>,
 Alexander Popov <alex.popov@linux.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Feb 12, 2021 at 09:11:50AM +0300, Arseny Krasnov wrote:
>
>On 11.02.2021 17:57, Stefano Garzarella wrote:
>> Hi Arseny,
>>
>> On Mon, Feb 08, 2021 at 09:32:59AM +0300, Arseny Krasnov wrote:
>>> On 07.02.2021 19:20, Michael S. Tsirkin wrote:
>>>> On Sun, Feb 07, 2021 at 06:12:56PM +0300, Arseny Krasnov wrote:
>>>>> 	This patchset impelements support of SOCK_SEQPACKET for virtio
>>>>> transport.
>>>>> 	As SOCK_SEQPACKET guarantees to save record boundaries, so to
>>>>> do it, two new packet operations were added: first for start of record
>>>>>  and second to mark end of record(SEQ_BEGIN and SEQ_END later). Also,
>>>>> both operations carries metadata - to maintain boundaries and payload
>>>>> integrity. Metadata is introduced by adding special header with two
>>>>> fields - message count and message length:
>>>>>
>>>>> 	struct virtio_vsock_seq_hdr {
>>>>> 		__le32  msg_cnt;
>>>>> 		__le32  msg_len;
>>>>> 	} __attribute__((packed));
>>>>>
>>>>> 	This header is transmitted as payload of SEQ_BEGIN and SEQ_END
>>>>> packets(buffer of second virtio descriptor in chain) in the same way as
>>>>> data transmitted in RW packets. Payload was chosen as buffer for this
>>>>> header to avoid touching first virtio buffer which carries header of
>>>>> packet, because someone could check that size of this buffer is equal
>>>>> to size of packet header. To send record, packet with start marker is
>>>>> sent first(it's header contains length of record and counter), then
>>>>> counter is incremented and all data is sent as usual 'RW' packets and
>>>>> finally SEQ_END is sent(it also carries counter of message, which is
>>>>> counter of SEQ_BEGIN + 1), also after sedning SEQ_END counter is
>>>>> incremented again. On receiver's side, length of record is known from
>>>>> packet with start record marker. To check that no packets were dropped
>>>>> by transport, counters of two sequential SEQ_BEGIN and SEQ_END are
>>>>> checked(counter of SEQ_END must be bigger that counter of SEQ_BEGIN by
>>>>> 1) and length of data between two markers is compared to length in
>>>>> SEQ_BEGIN header.
>>>>> 	Now as  packets of one socket are not reordered neither on
>>>>> vsock nor on vhost transport layers, such markers allows to restore
>>>>> original record on receiver's side. If user's buffer is smaller that
>>>>> record length, when all out of size data is dropped.
>>>>> 	Maximum length of datagram is not limited as in stream socket,
>>>>> because same credit logic is used. Difference with stream socket is
>>>>> that user is not woken up until whole record is received or error
>>>>> occurred. Implementation also supports 'MSG_EOR' and 'MSG_TRUNC' flags.
>>>>> 	Tests also implemented.
>>>>>
>>>>>  Arseny Krasnov (17):
>>>>>   af_vsock: update functions for connectible socket
>>>>>   af_vsock: separate wait data loop
>>>>>   af_vsock: separate receive data loop
>>>>>   af_vsock: implement SEQPACKET receive loop
>>>>>   af_vsock: separate wait space loop
>>>>>   af_vsock: implement send logic for SEQPACKET
>>>>>   af_vsock: rest of SEQPACKET support
>>>>>   af_vsock: update comments for stream sockets
>>>>>   virtio/vsock: dequeue callback for SOCK_SEQPACKET
>>>>>   virtio/vsock: fetch length for SEQPACKET record
>>>>>   virtio/vsock: add SEQPACKET receive logic
>>>>>   virtio/vsock: rest of SOCK_SEQPACKET support
>>>>>   virtio/vsock: setup SEQPACKET ops for transport
>>>>>   vhost/vsock: setup SEQPACKET ops for transport
>>>>>   vsock_test: add SOCK_SEQPACKET tests
>>>>>   loopback/vsock: setup SEQPACKET ops for transport
>>>>>   virtio/vsock: simplify credit update function API
>>>>>
>>>>>  drivers/vhost/vsock.c                   |   8 +-
>>>>>  include/linux/virtio_vsock.h            |  15 +
>>>>>  include/net/af_vsock.h                  |   9 +
>>>>>  include/uapi/linux/virtio_vsock.h       |  16 +
>>>>>  net/vmw_vsock/af_vsock.c                | 588 +++++++++++++++-------
>>>>>  net/vmw_vsock/virtio_transport.c        |   5 +
>>>>>  net/vmw_vsock/virtio_transport_common.c | 316 ++++++++++--
>>>>>  net/vmw_vsock/vsock_loopback.c          |   5 +
>>>>>  tools/testing/vsock/util.c              |  32 +-
>>>>>  tools/testing/vsock/util.h              |   3 +
>>>>>  tools/testing/vsock/vsock_test.c        | 126 +++++
>>>>>  11 files changed, 895 insertions(+), 228 deletions(-)
>>>>>
>>>>>  TODO:
>>>>>  - What to do, when server doesn't support SOCK_SEQPACKET. In current
>>>>>    implementation RST is replied in the same way when listening port
>>>>>    is not found. I think that current RST is enough,because case when
>>>>>    server doesn't support SEQ_PACKET is same when listener missed(e.g.
>>>>>    no listener in both cases).
>> I think is fine.
>>
>>>>    - virtio spec patch
>>> Ok
>> Yes, please prepare a patch to discuss the VIRTIO spec changes.
>>
>> For example for 'virtio_vsock_seq_hdr', I left a comment about 'msg_cnt'
>> naming that should be better to discuss with virtio guys.
>
>Ok, i'll prepare it in v5. So I have to send it both LKML(as one of patches) and
>
>virtio mailing lists? (e.g. virtio-comment@lists.oasis-open.org)

I think you can send the VIRTIO spec patch separately from this series 
to virtio-comment, maybe CCing virtualization@lists.linux-foundation.org

But Michael could correct me :-)

>
>>
>> Anyway, I reviewed this series and I left some comments.
>> I think we are in a good shape :-)
>Great, thanks for review. I'll consider all review comments in next 
>version.

Great!

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

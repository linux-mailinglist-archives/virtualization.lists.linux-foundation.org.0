Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E77323884
	for <lists.virtualization@lfdr.de>; Wed, 24 Feb 2021 09:23:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E5183CBE;
	Wed, 24 Feb 2021 08:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A6zaAjjKppCo; Wed, 24 Feb 2021 08:23:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EBF83CBD;
	Wed, 24 Feb 2021 08:23:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF4BBC000A;
	Wed, 24 Feb 2021 08:23:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E769C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 08:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FB1C6F5D3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 08:23:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIjkKIljzW47
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 08:23:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7827D606CF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 08:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614155006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JbGPMGc3zR5mJ9ryS3aC3fSGYocZkjlOuNb6WBZZ3I=;
 b=KSGq+666prtCURPW2NWMu9TT5irzC6T/ytkR3X0+dQZAp65bfqyRkCkL0+ZZklzaFoRmdC
 a4kx0Wy28vYagEajpFldjPPd9MCwmrRxbbpRVk6Jt/rA1CFq+8aiW9jaD31ozJgEG8Xtf2
 hUvTV3bR9mLtlMEP+vzC1iqSwXl1u9A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-DFknZ6OVNLGeAn21bnlVdw-1; Wed, 24 Feb 2021 03:23:24 -0500
X-MC-Unique: DFknZ6OVNLGeAn21bnlVdw-1
Received: by mail-wr1-f72.google.com with SMTP id s18so713834wrf.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 00:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1JbGPMGc3zR5mJ9ryS3aC3fSGYocZkjlOuNb6WBZZ3I=;
 b=b6HinstVefZtr4WkogMPXpGQQ/yBZoClmupcfarmHGz+mzNKxQhhK5lQ+x8l0G73Z2
 lLWM9r4HYCywpcqASIUAmxmMg6oAVkfZ+z0RhpPa/Fm9/uvAzBFPwToQUZHrMG7YUdml
 jRBraFAuKYwzg95Fmx4tQf8BBqey3TCqc+k+x3tKrAHILRpsq6/xt+E1X9evgwuH+W/+
 Bl+kxKtLFsY5wO02PY8Kbu2jLyaCStSbtUQMJp2GQ5njDDajZ0KR6DHHIAK/nJC1zuJT
 COlnRv6YAUIazEgfDu0M/1xhnq6jmHbJVcpa8LOMISONelgXk7U80IbNxiuCV9VkeJrJ
 frOw==
X-Gm-Message-State: AOAM533m+CWK1zLQ393TQLJkp3CxkMoDRRQz2ZKbNDUGzcUra/egpIhA
 FFu1mKDzcrultjdLC6RRpG9F9H9nu6ghBWLRxjzNKxpsC9FO6Y7OJxWrl70+iQI7Vnj3AZCTOI8
 Vm0TRq35xYOujvjltqzbyvqAfHK2j41MrYDVStTLwUg==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2574147wmi.117.1614155003182; 
 Wed, 24 Feb 2021 00:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwr2zof1ZDDqJMUOF+ohaSrHn1X03ArrZY1vRa0Mt+0/xGnqxU7+pV+gRMZdhng3Liw6tsb4Q==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr2574122wmi.117.1614155002974; 
 Wed, 24 Feb 2021 00:23:22 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a1sm2056803wrx.95.2021.02.24.00.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 00:23:22 -0800 (PST)
Date: Wed, 24 Feb 2021 09:23:19 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v5 00/19] virtio/vsock: introduce SOCK_SEQPACKET
 support
Message-ID: <20210224082319.yrmqr6zs7emvghw3@steredhat>
References: <20210218053347.1066159-1-arseny.krasnov@kaspersky.com>
 <20210222142311.gekdd7gsm33wglos@steredhat>
 <20210223145016.ddavx6fihq4akdim@steredhat>
 <7a280168-cb54-ae26-4697-c797f6b04708@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <7a280168-cb54-ae26-4697-c797f6b04708@kaspersky.com>
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
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Wed, Feb 24, 2021 at 07:29:25AM +0300, Arseny Krasnov wrote:
>
>On 23.02.2021 17:50, Stefano Garzarella wrote:
>> On Mon, Feb 22, 2021 at 03:23:11PM +0100, Stefano Garzarella wrote:
>>> Hi Arseny,
>>>
>>> On Thu, Feb 18, 2021 at 08:33:44AM +0300, Arseny Krasnov wrote:
>>>> 	This patchset impelements support of SOCK_SEQPACKET for virtio
>>>> transport.
>>>> 	As SOCK_SEQPACKET guarantees to save record boundaries, so to
>>>> do it, two new packet operations were added: first for start of record
>>>> and second to mark end of record(SEQ_BEGIN and SEQ_END later). Also,
>>>> both operations carries metadata - to maintain boundaries and payload
>>>> integrity. Metadata is introduced by adding special header with two
>>>> fields - message count and message length:
>>>>
>>>> 	struct virtio_vsock_seq_hdr {
>>>> 		__le32  msg_cnt;
>>>> 		__le32  msg_len;
>>>> 	} __attribute__((packed));
>>>>
>>>> 	This header is transmitted as payload of SEQ_BEGIN and SEQ_END
>>>> packets(buffer of second virtio descriptor in chain) in the same way as
>>>> data transmitted in RW packets. Payload was chosen as buffer for this
>>>> header to avoid touching first virtio buffer which carries header of
>>>> packet, because someone could check that size of this buffer is equal
>>>> to size of packet header. To send record, packet with start marker is
>>>> sent first(it's header contains length of record and counter), then
>>>> counter is incremented and all data is sent as usual 'RW' packets and
>>>> finally SEQ_END is sent(it also carries counter of message, which is
>>>> counter of SEQ_BEGIN + 1), also after sedning SEQ_END counter is
>>>> incremented again. On receiver's side, length of record is known from
>>>> packet with start record marker. To check that no packets were dropped
>>>> by transport, counters of two sequential SEQ_BEGIN and SEQ_END are
>>>> checked(counter of SEQ_END must be bigger that counter of SEQ_BEGIN by
>>>> 1) and length of data between two markers is compared to length in
>>>> SEQ_BEGIN header.
>>>> 	Now as  packets of one socket are not reordered neither on
>>>> vsock nor on vhost transport layers, such markers allows to restore
>>>> original record on receiver's side. If user's buffer is smaller that
>>>> record length, when all out of size data is dropped.
>>>> 	Maximum length of datagram is not limited as in stream socket,
>>>> because same credit logic is used. Difference with stream socket is
>>>> that user is not woken up until whole record is received or error
>>>> occurred. Implementation also supports 'MSG_EOR' and 'MSG_TRUNC' flags.
>>>> 	Tests also implemented.
>>> I reviewed the first part (af_vsock.c changes), tomorrow I'll review
>>> the rest. That part looks great to me, only found a few minor issues.
>> I revieiwed the rest of it as well, left a few minor comments, but I
>> think we're well on track.
>>
>> I'll take a better look at the specification patch tomorrow.
>Great, Thank You
>>
>> Thanks,
>> Stefano
>>
>>> In the meantime, however, I'm getting a doubt, especially with regard
>>> to other transports besides virtio.
>>>
>>> Should we hide the begin/end marker sending in the transport?
>>>
>>> I mean, should the transport just provide a seqpacket_enqueue()
>>> callbacl?
>>> Inside it then the transport will send the markers. This is because
>>> some transports might not need to send markers.
>>>
>>> But thinking about it more, they could actually implement stubs for
>>> that calls, if they don't need to send markers.
>>>
>>> So I think for now it's fine since it allows us to reuse a lot of
>>> code, unless someone has some objection.
>
>I thought about that, I'll try to implement it in next version. Let's see...

If you want to discuss it first, write down the idea you want to 
implement, I wouldn't want to make you do unnecessary work. :-)

Cheers,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DB03D366867
	for <lists.virtualization@lfdr.de>; Wed, 21 Apr 2021 11:54:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82B0A6089A;
	Wed, 21 Apr 2021 09:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbQe1CyayaYU; Wed, 21 Apr 2021 09:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 389FD60B4C;
	Wed, 21 Apr 2021 09:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA88CC0020;
	Wed, 21 Apr 2021 09:54:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E30BC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 09:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9BA40279
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 09:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jtxvdtlD1Yox
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 09:54:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E47A4027E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618998881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbqwyBdOoKIC/B1rwQvwf0abBxmSD3/OMSU0/73nzPo=;
 b=Kk6L3fetR0hE41+fQhFmNFaiphzfowi9r4Zsecl3uvCCCrj7Bn6tFMf5EbEJFjs1ik6Yxa
 JvG6MQGx2A7p+zZcegpq4+mPYW0/nT7UTRegYcvlsxO1tSnR/sE7AwcQVU+EmHe+obmhZl
 GEy7Lk5I43kL4GwfSB9en3IagwbXNW4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-Tm65hYHOPnK9DbYHjfa_PQ-1; Wed, 21 Apr 2021 05:54:29 -0400
X-MC-Unique: Tm65hYHOPnK9DbYHjfa_PQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f9-20020a50fe090000b02903839889635cso12753849edt.14
 for <virtualization@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 02:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GbqwyBdOoKIC/B1rwQvwf0abBxmSD3/OMSU0/73nzPo=;
 b=TfHNJSMn5VSxW3FBtIqDoVo7ejVfHmVaS/ZCmHQqUcnV5JwI4ViGlo++/hflf9KZlI
 FR/VZY0ifnunV9kR3dOh/iOIrELrtwsME052/VoHpqGPzlE/7GvKGY6mz3mnFZrqaPZR
 UeuxrJ9/JyjkjY7Oac3jDFc+8PlkyWNA53blEzbVPFDo6O/m1PwzdcYDimiisk0uxEbS
 dBCFNKUGvGZzptB8C5+W7G8zIwZt3GjTgyxgEwpuduwVBW3WajsR2NIxpXzlei5JlR46
 Sg3NFYE4VEbTNHCz0I9wvTzTDSC1WQmoT2vLw7oeYrQ+LIeB1GpVL64x7Hz8/zqR7bB2
 IgXw==
X-Gm-Message-State: AOAM533AiiY0yWDEZFzpZ5L0ZC0/5SRW4DVRaIrO1gZjQYgCzxiAsit7
 VfjJWZCSTd0CgyjM5QXXDJI4aWMAhs69thrNw6M69X0ceiyFJuQp9WE3FvLweL62zkcRwcOs4l/
 ld08mFrZXggWq51pQmREQ8Pc8uf5gqu8PYwWNlw7lQw==
X-Received: by 2002:a05:6402:51c6:: with SMTP id
 r6mr19096757edd.258.1618998868552; 
 Wed, 21 Apr 2021 02:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh6dShtRzAg9Lcn7C2pCChhSLza1gaekjVXVInKIrIiORMHcJsPED84lKjzyXW/g+h8Ymk+g==
X-Received: by 2002:a05:6402:51c6:: with SMTP id
 r6mr19096736edd.258.1618998868384; 
 Wed, 21 Apr 2021 02:54:28 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id v4sm1916169ejj.84.2021.04.21.02.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:54:28 -0700 (PDT)
Date: Wed, 21 Apr 2021 11:54:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] Re: [RFC PATCH v5 2/2] virtio-vsock:
 SOCK_SEQPACKET description
Message-ID: <20210421095425.3bkixnasl34g3t5p@steredhat>
References: <20210413125217.3416876-1-arseny.krasnov@kaspersky.com>
 <20210413125333.3419315-1-arseny.krasnov@kaspersky.com>
 <20210413090642-mutt-send-email-mst@kernel.org>
 <92a6b268-a36a-5f1b-2d67-02accfde70ce@kaspersky.com>
 <20210413155316-mutt-send-email-mst@kernel.org>
 <783d12e5-50b6-2363-f953-bc95d4b59d72@kaspersky.com>
 <20210421074523.s7wna25hsy65vc75@steredhat>
 <20210421042335-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210421042335-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, Jeff Vander Stoep <jeffv@google.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 "oxffffaa@gmail.com" <oxffffaa@gmail.com>,
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Apr 21, 2021 at 04:24:36AM -0400, Michael S. Tsirkin wrote:
>On Wed, Apr 21, 2021 at 09:45:23AM +0200, Stefano Garzarella wrote:
>> On Wed, Apr 14, 2021 at 09:04:47AM +0300, Arseny Krasnov wrote:
>> >
>> > On 13.04.2021 22:55, Michael S. Tsirkin wrote:
>> > > On Tue, Apr 13, 2021 at 05:22:44PM +0300, Arseny Krasnov wrote:
>> > > > On 13.04.2021 16:10, Michael S. Tsirkin wrote:
>> > > > > On Tue, Apr 13, 2021 at 03:53:29PM +0300, Arseny Krasnov wrote:
>> > > > > > This adds description of SOCK_SEQPACKET socket type
>> > > > > > support for virtio-vsock.
>> > > > > >
>> > > > > > Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>> > > > > > ---
>> > > > > >  virtio-vsock.tex | 26 +++++++++++++++++++++-----
>> > > > > >  1 file changed, 21 insertions(+), 5 deletions(-)
>> > > > > >
>> > > > > > diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>> > > > > > index ad57f9d..00e59cc 100644
>> > > > > > --- a/virtio-vsock.tex
>> > > > > > +++ b/virtio-vsock.tex
>> > > > > > @@ -16,7 +16,10 @@ \subsection{Virtqueues}\label{sec:Device Ty=
pes / Socket Device / Virtqueues}
>> > > > > >
>> > > > > >  \subsection{Feature bits}\label{sec:Device Types / Socket Dev=
ice / Feature bits}
>> > > > > >
>> > > > > > -There are currently no feature bits defined for this device.
>> > > > > > +\begin{description}
>> > > > > > +\item VIRTIO_VSOCK_F_SEQPACKET (0) SOCK_SEQPACKET socket type=
 is
>> > > > > > +    supported.
>> > > > > Does it make sense to only support seqpacket and not stream?
>> > > > > I am guessing not since seqpacket is more or less
>> > > > > a superset ...
>> > > > You mean, this sentence must be "Both SOCK_SEQPACKET and SOCK_STRE=
AM types
>> > > >
>> > > > are supported"?
>> > >
>> > > No. I am asking whether we want a feature bit for SOCK_STREAM too?
>> >
>> > I think=A0 there is no practical sense in SOCK_STREAM bit, because SOC=
K_SEQPACKET
>> >
>> > is stream + message boundaries and potential DGRAM is completely diffe=
rent
>> >
>> > thing. Of course i can implement it in my patches and also add it to s=
pec patch, but=A0 i see only
>> >
>> > esthetic in this: all three socket types have own feature bits.
>> >
>>
>> I agree that it may make sense to have a bit for SOCK_STREAM. For exampl=
e we
>> may have devices in the future that want to implement only DGRAM for
>> simplicity.
>>
>> I'm just worried about backwards compatibility with current devices wher=
e we
>> don't have any feature bit.
>>
>> Should we add a negative feature flag? (e.g. VIRTIO_VSOCK_F_NO_STREAM)
>> I don't like it much, but I can't think of anything better.
>>
>> Thanks,
>> Stefano
>
>We can simply specify that if there are no feature bits at all then
>stream is assumed supported.
>

oh yeah, that sounds like a good idea!

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

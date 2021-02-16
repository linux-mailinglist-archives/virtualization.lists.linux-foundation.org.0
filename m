Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344631C724
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 09:10:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 232256F51C
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 08:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yXnNQDHWndp3 for <lists.virtualization@lfdr.de>;
	Tue, 16 Feb 2021 08:09:56 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 1FEBE6F565; Tue, 16 Feb 2021 08:09:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296D16ED68;
	Tue, 16 Feb 2021 08:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9A91C013A;
	Tue, 16 Feb 2021 08:09:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94351C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 08:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7B1FE86F66
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 08:09:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kyx+OmJs-8Bh
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 08:09:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 43F7286F65
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613462958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kf7OmlJTePZJi+RP/1WQfyenvSVjyrQcCcofpJnIyUY=;
 b=TcMcpTXC1xr69N9uhntSujIX2hDXcbSUEaZIXIClqNOcGFyCHUiU3DDtbYuG6vh8c6ox8S
 WveY/gWfxfYz5PkSJMZ0/+yvoWuBqY98xm7k3Tkvq/Dj7Cew9ppq3HvgMSLd7t0JjyZiSm
 GnmAOxagpdFpgD+IQ7GRn0rhslBg4zI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-EulQlDheMXWLu07Frb-wPw-1; Tue, 16 Feb 2021 03:09:15 -0500
X-MC-Unique: EulQlDheMXWLu07Frb-wPw-1
Received: by mail-wr1-f70.google.com with SMTP id p11so12779427wrm.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 00:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kf7OmlJTePZJi+RP/1WQfyenvSVjyrQcCcofpJnIyUY=;
 b=H/1xuvlRuym86bD8z8zuXukmvcKKVeq3G/vQHd6dhlIJKCNHf4fF3WymmlPwcg8sXb
 vEn4fI4/CC4oGZYG9qaEAYg0cXJb52OWJ6jFccWXAkTcYpvxPn2o78rfwiqLVDJxGbGu
 wZ3ZpE+jXFcC4LzmoK1PR06nUKPtaefV9ETbTQLm2O+/i6ntPerSluIYz1cbjTfHqczY
 9NbtTRxEksyC9m9TENYezbUEGRLpJze+t+IYIli6Vg9CHbCH2o90sDLyv003tYTek7He
 qs2SU3PaEElz6zkVZrSygfkii5awWocJAQ+Pq7vVUe0ll6apzNpOjfbO7uFuGDTqoVM5
 +IjQ==
X-Gm-Message-State: AOAM530K8rJAWB0YmUf4KZ/3d1vugfy77eSHbZW3aiRXbRcRjjeGFJ7M
 5KK3TSDiPSLHVEgwiyudBUs2umSvwQRE+d4yIuE6As09bjzheMm+SyfBJETIspwK98UX0KWc/ey
 2gnZHtFTOEGy8dm5cyeCu16Za/GsgTuing/8xsphERg==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr22289934wrv.182.1613462954668; 
 Tue, 16 Feb 2021 00:09:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxexvCHi7Fhus8WkSbkVWZKMD8gy5N2ZGtrTBb5k2LmwacO1DlfpSplD0MbE9VrFpiWWKKgkA==
X-Received: by 2002:a5d:54ce:: with SMTP id x14mr22289918wrv.182.1613462954515; 
 Tue, 16 Feb 2021 00:09:14 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id w81sm883003wmb.3.2021.02.16.00.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 00:09:14 -0800 (PST)
Date: Tue, 16 Feb 2021 09:09:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Jiang Wang ." <jiang.wang@bytedance.com>
Subject: Re: [External] Re: vsock virtio: questions about supporting DGRAM type
Message-ID: <20210216080911.lgw7cgo4rvxzaehx@steredhat>
References: <CAP_N_Z97rUvCSNoKAkxhyw9FJWQ2tJ0Wv5srHzR387j_S_6pjA@mail.gmail.com>
 <20210212090230.bai6xkx6gne53p3i@steredhat>
 <CAP_N_Z-4Af_5jE7x5kSi8u=KUVUsbfDTtuD_7numL+vnkisMgQ@mail.gmail.com>
 <20210215083110.xb4cyekutlmlvetg@steredhat>
 <CAP_N_Z9T5nJ37k9Rgoba_SzN9RQrBn7jCKwxO9TLyddzb+jsJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP_N_Z9T5nJ37k9Rgoba_SzN9RQrBn7jCKwxO9TLyddzb+jsJQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>,
 mst@redhat.com, imbrenda@linux.vnet.ibm.com, xieyongji@bytedance.com,
 stefanha@redhat.com, asias@redhat.com,
 virtualization@lists.linux-foundation.org,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
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

On Mon, Feb 15, 2021 at 08:50:36PM -0800, Jiang Wang . wrote:
>On Mon, Feb 15, 2021 at 12:31 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Sat, Feb 13, 2021 at 03:26:18PM -0800, Jiang Wang . wrote:
>> >On Fri, Feb 12, 2021 at 1:02 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> >>
>> >> Hi Jiang,
>> >>
>> >> CCing Arseny who is working on SOCK_SEQPACKET support for virtio-vsock
>> >> [1].
>> >>
>> >> On Thu, Feb 11, 2021 at 10:04:34PM -0800, Jiang Wang . wrote:
>> >> >Hi guys,
>> >> >
>> >> >I am working on supporting DGRAM type for virtio/vhost vsock. I
>> >> >already did some work and a draft code is here (which passed my tests,
>> >> >but still need some cleanup and only works from host to guest as of
>> >> >now, will add host to guest soon):
>> >> >https://github.com/Jiang1155/linux/commit/4e89736e0bce15496460ff411cb4694b143d1c3d
>> >> >qemu changes are here:
>> >> >https://github.com/Jiang1155/qemu/commit/7ab778801e3e8969ab98e44539943810a2fb03eb
>> >> >
>> >> >Today, I just noticed that the Asias had an old version of virtio
>> >> >which had both dgram and stream support, see this link:
>> >> >https://kvm.vger.kernel.narkive.com/BMvH9eEr/rfc-v2-0-7-introduce-vm-sockets-virtio-transport#post1
>> >> >
>> >> >But somehow, the dgram part seems never merged to upstream linux (the
>> >> >stream part is merged). If so, does anyone know what is the reason for
>> >> >this? Did we drop dgram support for some specific reason or the code
>> >> >needs some improvement?
>> >>
>> >> I wasn't involved yet in virtio-vsock development when Asias posted that
>> >> patches, so I don't know the exact reason.
>> >>
>> >> Maybe could be related on how to handle the credit mechanism for a
>> >> connection-less sockets and how to manage the packet queue, if for
>> >> example no one is listening.
>> >>
>> >
>> >I see. thanks.
>> >
>> >> >
>> >> >My current code differs from Asias' code in some ways. It does not use
>> >> >credit and does not support fragmentation.  It basically adds two virt
>> >>
>> >> If you don't use credit, do you have some threshold when you start to
>> >> drop packets on the RX side?
>> >>
>> >
>> >As of now, I don't have any threshold to drop packets on RX side. In my
>> >view, DGRAM is like UDP and is a best effort service. If the virtual
>> >queue
>> >is full on TX (or the available buffer size is less than the packet size),
>> >I drop the packets on the TX side.
>>
>> I have to check the code, my concern is we should have a limit for the
>> allocation, for example if the user space doesn't consume RX packets.
>>
>
>I think we already have a limit for the allocation. If a DGRAM client
>sends packets while no socket is bound on the server side ,
>the packet will be dropped when looking for the socket. If the socket is
>bound on the server side, but the server program somehow does not
>call recv or similar functions, the packets will be dropped when the
>buffer is full as in your previous patch at here:
>https://lore.kernel.org/patchwork/patch/1141083/
>If there are still other cases that we don't have protection, let me know and
>I can add some threshold.

Maybe I misunderstood, but I thought you didn't use credit for DGRAM 
messages.

If you use it to limit buffer occupancy, then it should be okay, but 
again, I still have to look at the code :-)

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147A3958E1
	for <lists.virtualization@lfdr.de>; Mon, 31 May 2021 12:20:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B246060A49;
	Mon, 31 May 2021 10:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgM6PlfDLRJy; Mon, 31 May 2021 10:20:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93AA860A4A;
	Mon, 31 May 2021 10:20:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3590DC0024;
	Mon, 31 May 2021 10:20:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7E65C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 10:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4C1340377
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 10:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYVTpvEXdsBD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 10:20:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A0C6401FD
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622456427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h+I4L8Ybm0KB4Gou+uepbAq9mkXVhCftc/wwnbvVOfU=;
 b=NfXjIhRpvB2g1f9UjfQEGkm4RE88jQmj7bt30Fs2KFIB8/+5K3F1f+AwSZ9Sud7qZpiYU3
 ddV+DFjLVzYyL5JLo64GCF4iypXSr8jlVG3kicXspPrEpRgGtwJzV1OL5soy0R5oKKd8T2
 BSLnCau13HOlbEBnc/yqdY0OUQWC6QU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-_snnUtbwOCqlwGgY_ppdAA-1; Mon, 31 May 2021 06:20:26 -0400
X-MC-Unique: _snnUtbwOCqlwGgY_ppdAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so1573539wrm.17
 for <virtualization@lists.linux-foundation.org>;
 Mon, 31 May 2021 03:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+I4L8Ybm0KB4Gou+uepbAq9mkXVhCftc/wwnbvVOfU=;
 b=PXsYzT76NNWRpRmVLwoGRDSxwZjZG+rmduRAtRbdSZK4amD4yGvlCZtIw3VB0gKzlt
 wsdEiYJ4t5vksWr5xHv04jXlzyp5qxmP3HlVwpEt9dEZ7yUXcNj5pE3zegaItKiTEGJD
 eOIJMtJI+9aOd7jkeJN7KNUreZInt++hIV5As2YYLDFSgP28LaaHgLYgsoXC9VnD5NUY
 AVmwsCaTuTMHE3EwimwSiOEjJfWMMGrhiGmM5YJy1961CZXoMyzXTmb5SOOcVDZfHFCX
 YW6RtAndjajzNdCMNaFhwOdKRAYKQvJj0g6faOakYzsVf4ZOgCZ+QOY4ebEhZ7d58/HF
 7EBg==
X-Gm-Message-State: AOAM531oFyE7fzjXT8Q5LiUZC3PNFvV08Vk3lS59mwbuxt1R1OxNVqe1
 pfsvGuJSZqBew1rzRDqvrWdKZ4HdhInDUHC9zN3sLPljyVIk/tXmjL6u8MkRiVWQwCUgsPdu6rA
 qptOrmP1fYa8L8eIQtox78wwZKWxdzVoz68DdQtl9pA==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr20568568wmk.35.1622456424933; 
 Mon, 31 May 2021 03:20:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPYHUVdhYBLl6N+z8Oi12/8I7xJS2//O9Zz03YW4kCtGt7KRIltZrH+UlPPfleL3cO8QH9mQ==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr20568557wmk.35.1622456424786; 
 Mon, 31 May 2021 03:20:24 -0700 (PDT)
Received: from redhat.com ([2a00:a040:196:94e6::1002])
 by smtp.gmail.com with ESMTPSA id u8sm5115260wrb.77.2021.05.31.03.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 03:20:24 -0700 (PDT)
Date: Mon, 31 May 2021 06:20:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Subject: Re: [PATCH RESEND 1/2] virtio: update virtio id table, add
 transitional ids
Message-ID: <20210531061955-mutt-send-email-mst@kernel.org>
References: <20210531072743.363171-1-lingshan.zhu@intel.com>
 <20210531072743.363171-2-lingshan.zhu@intel.com>
 <20210531095804.47629646.cohuck@redhat.com>
 <53862384-be2b-4a5f-adbb-37eb25ec9fe1@intel.com>
MIME-Version: 1.0
In-Reply-To: <53862384-be2b-4a5f-adbb-37eb25ec9fe1@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Mon, May 31, 2021 at 05:57:47PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 5/31/2021 3:58 PM, Cornelia Huck wrote:
> > On Mon, 31 May 2021 15:27:42 +0800
> > Zhu Lingshan <lingshan.zhu@intel.com> wrote:
> > 
> > > This commit updates virtio id table by adding transitional device
> > > ids
> > > virtio_pci_common.h
> > > Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > > ---
> > >   include/uapi/linux/virtio_ids.h | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> > > index f0c35ce8628c..fcc9ec6a73c1 100644
> > > --- a/include/uapi/linux/virtio_ids.h
> > > +++ b/include/uapi/linux/virtio_ids.h
> > > @@ -57,4 +57,16 @@
> > >   #define VIRTIO_ID_BT			28 /* virtio bluetooth */
> > >   #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> > > +/*
> > > + * Virtio Transitional IDs
> > > + */
> > > +
> > > +#define VIRTIO_TRANS_ID_NET		1000 /* transitional virtio net */
> > > +#define VIRTIO_TRANS_ID_BLOCK		1001 /* transitional virtio block */
> > > +#define VIRTIO_TRANS_ID_BALLOON		1002 /* transitional virtio balloon */
> > > +#define VIRTIO_TRANS_ID_CONSOLE		1003 /* transitional virtio console */
> > > +#define VIRTIO_TRANS_ID_SCSI		1004 /* transitional virtio SCSI */
> > > +#define VIRTIO_TRANS_ID_RNG		1005 /* transitional virtio rng */
> > > +#define VIRTIO_TRANS_ID_9P		1009 /* transitional virtio 9p console */
> > > +
> > >   #endif /* _LINUX_VIRTIO_IDS_H */
> > Isn't this a purely virtio-pci concept? (The spec lists the virtio ids
> > in the common section, and those transitional ids in the pci section.)
> > IOW, is there a better, virtio-pci specific, header for this?
> Hi Cornelia,
> 
> yes they are pure virtio-pci transitional concept. There is a virtio_pci.h,
> but not looks like
> a good place for these stuffs, Michael ever suggested to add these ids to
> virtio_ids.h, so I have
> chosen this file.
> 
> https://www.spinics.net/lists/netdev/msg739269.html

Didn't think straight, virtio_pci.h is better.

> Thanks
> Zhu Lingshan
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C51C6CD2
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 11:26:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D988B24CB2;
	Wed,  6 May 2020 09:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsF7OPBD3tn3; Wed,  6 May 2020 09:25:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 88BEB24C8F;
	Wed,  6 May 2020 09:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70E86C0859;
	Wed,  6 May 2020 09:25:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4910CC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 30A1286AAB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANcc11Xbc1Qg
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:25:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 807F086AA5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588757154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bim1c8eCjYcLbuTSswn0dpCBvXNi8zOQ0N1tlPafZn4=;
 b=a/WX2MvpVfdLwgMlWsGaXFmhPJcEm7GcakNQf4XqzojKV3Faq0mIzyu3iSox1aInkgs6G2
 3kXdS1nfFOMklUg4HOCBZHDgQMasoFz6YVizWYfuT7YcnmF96jDMbwGqbTZaYEkyJMCYHv
 uyows5NyV74pEW5pv34t7DNBcGNFeTI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-09GP0J6uOc-O-pDJuSODqQ-1; Wed, 06 May 2020 05:25:50 -0400
X-MC-Unique: 09GP0J6uOc-O-pDJuSODqQ-1
Received: by mail-wm1-f71.google.com with SMTP id f17so485440wmm.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 02:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bim1c8eCjYcLbuTSswn0dpCBvXNi8zOQ0N1tlPafZn4=;
 b=hzYdM91L4p6F1nnTVJF4HAkSG6plU5+wZhs7r9zMZOxMTtv93fEFC3taixAYV4ws2U
 ub4C4HbfSTm2cksZpyW+fAszOPiugEu6CX1N+hcjBRAshUPQjZW4MmVQhxHm2k2QHzOh
 ceoVeYn+Nys/FpzYTw/90Hc7JiWqzmYCGphlFeVm+wz5/LzqY12zQnU9qbJ+qG08m0EA
 ii9YdRtXDv69l8duF14swgeLSg2KSoIiMAoxt1EIfSXQGrWjo3rroZCjO32NlwSNe2u5
 367QkdA9FahOIbc8MVouAMlXfs0RXCgrNj3+/XC6oefm3wNdZAFOAvnvYxPoy01INO09
 Y1ow==
X-Gm-Message-State: AGi0Pub0xOgIzoT5CUqWpz78M8iyKPanRVWwWvkndWj7Yeew7avesVNE
 pP8/SQMI7fepg99ffFkH+L+IIn3H601FhtMVxbLS4KLcmt7BV8HkPeyuDY6+eRywQuyh74doLPe
 IuOo+/57dJFFnXqJELa+oGf0zp7tefucjJknF4L6VlQ==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr7131681wrn.22.1588757149675; 
 Wed, 06 May 2020 02:25:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypKDcQLCEb81yrXyKaZpg3LwlEaXE+I6k94/3G8d4AwC2GS8U1KX5Fn5b7fyFPoR8Cv9PqLECw==
X-Received: by 2002:adf:dfcd:: with SMTP id q13mr7131657wrn.22.1588757149453; 
 Wed, 06 May 2020 02:25:49 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id c25sm2030281wmb.44.2020.05.06.02.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 02:25:48 -0700 (PDT)
Date: Wed, 6 May 2020 11:25:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [GIT PULL] vhost: fixes
Message-ID: <20200506092546.o6prnn4d66tavmjl@steredhat>
References: <20200504081540-mutt-send-email-mst@kernel.org>
 <AM6PR08MB40696EFF8BE389C134AC04F6F7A40@AM6PR08MB4069.eurprd08.prod.outlook.com>
 <20200506031918-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200506031918-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "n.b@live.com" <n.b@live.com>, Justin He <Justin.He@arm.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ldigby@redhat.com" <ldigby@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On Wed, May 06, 2020 at 03:19:55AM -0400, Michael S. Tsirkin wrote:
> On Wed, May 06, 2020 at 03:28:47AM +0000, Justin He wrote:
> > Hi Michael
> > 
> > > -----Original Message-----
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, May 4, 2020 8:16 PM
> > > To: Linus Torvalds <torvalds@linux-foundation.org>
> > > Cc: kvm@vger.kernel.org; virtualization@lists.linux-foundation.org;
> > > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; Justin He
> > > <Justin.He@arm.com>; ldigby@redhat.com; mst@redhat.com; n.b@live.com;
> > > stefanha@redhat.com
> > > Subject: [GIT PULL] vhost: fixes
> > >
> > > The following changes since commit
> > > 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c:
> > >
> > >   Linux 5.7-rc3 (2020-04-26 13:51:02 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus
> > >
> > > for you to fetch changes up to
> > > 0b841030625cde5f784dd62aec72d6a766faae70:
> > >
> > >   vhost: vsock: kick send_pkt worker once device is started (2020-05-02
> > > 10:28:21 -0400)
> > >
> > > ----------------------------------------------------------------
> > > virtio: fixes
> > >
> > > A couple of bug fixes.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > ----------------------------------------------------------------
> > > Jia He (1):
> > >       vhost: vsock: kick send_pkt worker once device is started
> > 
> > Should this fix also be CC-ed to stable? Sorry I forgot to cc it to stable.
> > 
> > --
> > Cheers,
> > Justin (Jia He)
> 
> 
> Go ahead, though recently just including Fixes seems to be enough.
> 

The following patch Justin refers to does not contain the "Fixes:" tag:

0b841030625c vhost: vsock: kick send_pkt worker once device is started


I think we should merge it on stable branches, so if needed, I can backport
and send it.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

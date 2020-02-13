Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 170EF15C564
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:56:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C0E26860E6;
	Thu, 13 Feb 2020 15:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3X3xa_ttoCx; Thu, 13 Feb 2020 15:56:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EABCD860C9;
	Thu, 13 Feb 2020 15:56:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9B60C0177;
	Thu, 13 Feb 2020 15:56:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4D8DC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A3AC92034B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mhU+XOYy9kQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:56:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id F22552010C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581609369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4QU7uZENcxRUfqiM7K3X0/JKBCsiyDClS/c2wdkQrjg=;
 b=iGfuaLkI/y8+BEpVRyRZlE87BL6SRJSeHb2Tr8q1ysdaIGCy4kW668O2515iqRT36iaQQ9
 BlsfPyuvRqIwKvBl0U89I6Wo/ghJe+2NqwFUPiDu9d+fBqSxEV/Y6notrHJp2ybsTeoWwt
 g65IunAPEWL6p6qAE5TuD49n9aQ/Nmg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-JrqZ-4D7MY2bFM0A5FTQWA-1; Thu, 13 Feb 2020 10:56:08 -0500
Received: by mail-qt1-f199.google.com with SMTP id b5so3921062qtt.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4QU7uZENcxRUfqiM7K3X0/JKBCsiyDClS/c2wdkQrjg=;
 b=GwweHwUiMg0YMUP6x3ldDZVREXFRvfjt4aZtaWqnTOKJ6ll4Mj7HJvtXuU7WseLG8R
 RYX8cTCv09c6FbDOKypaWoWWZera3gqnuE6MFei5rp0dKns271Y+ou4BIJiBHwatzY1B
 MyPR8sKEIRygqC7q9gEpNgv+/9pj/G8j44aE8Ab9zqaRLUHS97EOwS91nONApscuiZJX
 ToADSPsNTSw84W5TW6/0f5x93bkfeJXImdAGRHeAqbCxOMphEHC3Yz+EHWWBOYG4gLO2
 rhrd41z24QlGIm4a2/SGIjlQb4IO0vY/pdmLF5WR6LVBpx3TGhvEImx1oXco5zLGCEB0
 rCmQ==
X-Gm-Message-State: APjAAAXUwMmgIwNdxfIYJEIGAn++Phfl19t35T9Jcw51AzI9G5IH3euO
 yPu5QQFqM6cBHnThdpSes4GQi3s6Tl3uOFZ6qh6tqfw8RV4A0g6iR0jozByoPoZX3eITsOMGqrZ
 ryuWG7TyK/gHP/SOpLpz1pi4C504/68APm6px1OjjQw==
X-Received: by 2002:a05:620a:2194:: with SMTP id
 g20mr12784473qka.227.1581609367941; 
 Thu, 13 Feb 2020 07:56:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwTNCl9VOR9NXth70L4mcZCSxDTc7p2/DaWb9KB+fHDHe7f/L4NfXn5L3kN2ExjUDHM2UKSQ==
X-Received: by 2002:a05:620a:2194:: with SMTP id
 g20mr12784445qka.227.1581609367767; 
 Thu, 13 Feb 2020 07:56:07 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 z21sm1523631qka.122.2020.02.13.07.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:56:07 -0800 (PST)
Date: Thu, 13 Feb 2020 10:56:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Message-ID: <20200213105425-mutt-send-email-mst@kernel.org>
References: <20200210035608.10002-4-jasowang@redhat.com>
 <20200211134746.GI4271@mellanox.com>
 <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <20200213103714-mutt-send-email-mst@kernel.org>
 <20200213155154.GX4271@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200213155154.GX4271@mellanox.com>
X-MC-Unique: JrqZ-4D7MY2bFM0A5FTQWA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 rob.miller@broadcom.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, haotian.wang@sifive.com, mhabets@solarflare.com,
 shahafs@mellanox.com, parav@mellanox.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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

On Thu, Feb 13, 2020 at 11:51:54AM -0400, Jason Gunthorpe wrote:
> > That bus is exactly what Greg KH proposed. There are other ways
> > to solve this I guess but this bikeshedding is getting tiring.
> 
> This discussion was for a different goal, IMHO.

Hmm couldn't find it anymore. What was the goal there in your opinion?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

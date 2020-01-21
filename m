Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAB143F3F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 15:18:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D727C858FB;
	Tue, 21 Jan 2020 14:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lHiMFI7UcVOs; Tue, 21 Jan 2020 14:18:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B4BB850E9;
	Tue, 21 Jan 2020 14:18:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66516C0174;
	Tue, 21 Jan 2020 14:18:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6AB4C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D1C778768B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:18:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RA04eGFOOzRw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0D0E185ACC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579616276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=weYoN+US5pU0ArR581BNHqxlBCJqtsz9O4P+flr6fqg=;
 b=O7yRA6K45XDRe+NlK+2+QxgfD18wWIvicEtKiD9qkOSbeoC6pMSPSnjGYTyX0EpzB3UC56
 5XVI2PwjorVDFI2D6Hmw0FKOubNSJFtBYW+SlUs+SSff3ETkFbY1GiUsjFuv9a2sWp9MXQ
 JV5CLPCOHpZODCI4e7i8dgFJhyLTtsM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-u0dSf7xUMbmhiBwjwkn1sg-1; Tue, 21 Jan 2020 09:17:54 -0500
Received: by mail-qt1-f198.google.com with SMTP id t4so1984098qtd.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 06:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=weYoN+US5pU0ArR581BNHqxlBCJqtsz9O4P+flr6fqg=;
 b=eMYb4jgYzpJscCc35uj9GMMZkExOSuqdgDLzHCC5mDM0aMzjKkfLThsFM3g7FNvRwv
 VPl1z/XGOm6wMIwGIGus9FZX5p0KLLhAsBl1plItNtCrkeH39U2VQAnRx68ulLTV16fR
 Rtl3rf2VHhmExUwpMowm+vhGN8Bm2tdTzW4dJKvV1yMDo4zCbwcdpP5cbdE0qf+EmXDL
 obmmrVQueSO8It0pjloBbyWLy+NByQeumbQ6n6E5pQJvy0Tq2icg7+OJFShsAm6U5sBI
 I4t1AKwZuF3uKcixeaQWtVbot+4ryx40hVN2xAlCyDuN7qbBRcP5Pn+PsIQZVgTbuEVz
 J6RA==
X-Gm-Message-State: APjAAAVYWkxDYvmd2kSLUNH9EboZtiDhEUHrNW1qsXJJAqcOrxVVNCyc
 E9B6gGVGQAaPd8gRgOP6tWo3alQvmak9JMAky15yuC3lPCrA2oVirxhe03mBTsc8zJcj45iu01q
 wG2je6uQA0MjXDhVxF/5pgZbensEaeUKhTatuvtJGAA==
X-Received: by 2002:a37:ad0e:: with SMTP id f14mr4590859qkm.213.1579616274072; 
 Tue, 21 Jan 2020 06:17:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqwj1pwuzC/egPO4VzjPyAoce9o3J4cQVep1NUGRibBObTVNFPOqxPxAnfDJfRf0s0obsdxWcg==
X-Received: by 2002:a37:ad0e:: with SMTP id f14mr4590813qkm.213.1579616273755; 
 Tue, 21 Jan 2020 06:17:53 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id u4sm17072928qkh.59.2020.01.21.06.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:17:53 -0800 (PST)
Date: Tue, 21 Jan 2020 09:17:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200121091636-mutt-send-email-mst@kernel.org>
References: <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <2a324cec-2863-58f4-c58a-2414ee32c930@redhat.com>
 <20200121004047-mutt-send-email-mst@kernel.org>
 <b9ad744e-c4cd-82f9-f56a-1ecc185e9cd7@redhat.com>
 <20200121031506-mutt-send-email-mst@kernel.org>
 <20200121140456.GA12330@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200121140456.GA12330@mellanox.com>
X-MC-Unique: u0dSf7xUMbmhiBwjwkn1sg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

On Tue, Jan 21, 2020 at 02:05:04PM +0000, Jason Gunthorpe wrote:
> On Tue, Jan 21, 2020 at 03:15:43AM -0500, Michael S. Tsirkin wrote:
> > > This sounds more flexible e.g driver may choose to implement static mapping
> > > one through commit. But a question here, it looks to me this still requires
> > > the DMA to be synced with at least commit here. Otherwise device may get DMA
> > > fault? Or device is expected to be paused DMA during begin?
> > > 
> > > Thanks
> > 
> > For example, commit might switch one set of tables for another,
> > without need to pause DMA.
> 
> I'm not aware of any hardware that can do something like this
> completely atomically..

FWIW VTD can do this atomically.

> Any mapping change API has to be based around add/remove regions
> without any active DMA (ie active DMA is a guest error the guest can
> be crashed if it does this)
> 
> Jason

Right, lots of cases are well served by only changing parts of
mapping that aren't in active use. Memory hotplug is such a case.
That's not the same as a completely static mapping.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

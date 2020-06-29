Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060320CCC7
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 08:33:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23100886E6;
	Mon, 29 Jun 2020 06:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nrm-+g+2Wsz1; Mon, 29 Jun 2020 06:33:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B5C5886E9;
	Mon, 29 Jun 2020 06:33:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AAFBC016E;
	Mon, 29 Jun 2020 06:33:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79A5AC016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 06:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 682B2220DA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 06:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLvNJIMdmOYd
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 06:33:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 2BB3D2051B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 06:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593412428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Iiom3LNVi9ET0XgfPNiU1I3DflByt3ZNInrS8hmdp2U=;
 b=RvTva7yvWQJRqvtjLrnc/EM+idCCJEHhG9hgfioileljWjAEPy856c65mhWJCfuOmXs9e9
 OGXr2wScFqvevQWvWrrh5xDvzlgKdMnIO/IQPEkBgNn2g9yq2yG8tMvII9ABOJLEUQn9jv
 HbblSDoldsoqs73nUBpU7Aoazs5mAQE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-17A8oRdVMeaxE2tgy4ysjA-1; Mon, 29 Jun 2020 02:33:44 -0400
X-MC-Unique: 17A8oRdVMeaxE2tgy4ysjA-1
Received: by mail-wr1-f71.google.com with SMTP id y13so16132550wrp.13
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 23:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Iiom3LNVi9ET0XgfPNiU1I3DflByt3ZNInrS8hmdp2U=;
 b=TH6Q6w+BL9JNw5j119dWFzr95jBVU6O/LHAw/Uq6d7ZKUnYxCaoqhPC33aiDislNwd
 viO1s/OEGaOUgNzx1Yg2rIZR39lblF7mkZUZfTyjoRs0mSXAUGQa92iGeTAjmwddSBpk
 ZywMawq24D2Z+X/O5QdnlU1CrTOQ4zf1rVlyldBs7N8cgqsm5V5KhyJyrAiTicX5e0A+
 A6jP7atBOcSPKWjKJczdFRzQp2nsmL/DKb1Mwypajnuz8giywIAbpBjr2ZpE8pmgQ4Jk
 8SpRbwGtlI73IgIB9U6OerK9/XBQjrl3LVWItXHfYvifFUfFX1VJ+iRHh5jthp3h52DT
 5y0Q==
X-Gm-Message-State: AOAM530ZmBuu/M7mjBauU6YvZ7383AtJdB2qWOhh1H/mQxEBt+hpKGmZ
 Z8L7DvOExYDREOKE935RtU+kObHHsixn4+uv0mTKhOeclT+haWul13zumrOSsnoKJr2lKzT2zrP
 gOXGrr2mK/i5g2PWWCZvBVCdGIFVuQHVUTkisJECnxg==
X-Received: by 2002:adf:8067:: with SMTP id 94mr14821902wrk.427.1593412423677; 
 Sun, 28 Jun 2020 23:33:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfYJ1M6jIB+Bt9+iuqmCS+1/JuHYbah8AxWL9RwY6izIKRHTcVkotYUsuHjo+DZqHXAwCswQ==
X-Received: by 2002:adf:8067:: with SMTP id 94mr14821888wrk.427.1593412423531; 
 Sun, 28 Jun 2020 23:33:43 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 s8sm41059111wru.38.2020.06.28.23.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 23:33:42 -0700 (PDT)
Date: Mon, 29 Jun 2020 02:33:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200629023225-mutt-send-email-mst@kernel.org>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20200629022124-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27602AB2A9A242D79343CE48886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB27602AB2A9A242D79343CE48886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Mon, Jun 29, 2020 at 06:25:41AM +0000, Peng Fan wrote:
> > > > > Anyway, re-reading the last messages of the original thread [1],
> > > > > it looks like Peng had a clear idea on how to fix the general issue.
> > > > > Peng, what happened with that?
> > >
> > > We shrinked the rpmsg reserved area to workaround the issue.
> > > So still use the dma apis in rpmsg.
> > >
> > > But here I am going to address domu android trusty issue using virtio.
> > 
> > My suggestion is to first of all fix DMA API so it works properly.
> 
> Could you please elaborate more details?
> 
> You mean the DMA API usage of rpmsg? Or xen domu dma_ops?
> 
> Thanks,
> Peng. 

Not 100% sure but I think xen dma ops.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

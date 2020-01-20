Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F3841143363
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 22:25:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 190AA86123;
	Mon, 20 Jan 2020 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sb9jMzBol7F2; Mon, 20 Jan 2020 21:25:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E54A8608B;
	Mon, 20 Jan 2020 21:25:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4517EC0174;
	Mon, 20 Jan 2020 21:25:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FF6FC0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 286D587404
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ZCUSCl5tqRs
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:25:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DB10C873BC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579555536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9l++3OuyTlK7LXp5Mq/OwpRSmGcumz9fcGOybYboMEQ=;
 b=PwoSQFD37XCoWdHLcxkngtwb8sM/gT5FpvlxGBzrrZ22VuvdE8/q4rbMUL+JleUtmOTzlg
 tGRX0s2u8XIqY8sHHZkcNF94LYKLtqZmGYOxaZrUTrlTF3yUbsTQZ8dnAXD5CffySDLgeu
 K+LXqjrxvzpwU3kpZVEXGvPH+u58d0I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-3mnxGJmVPhyx3MoG6ulHZw-1; Mon, 20 Jan 2020 16:25:33 -0500
Received: by mail-qk1-f200.google.com with SMTP id v2so190055qkf.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9l++3OuyTlK7LXp5Mq/OwpRSmGcumz9fcGOybYboMEQ=;
 b=MQjTcmC8Ug27ER5IdzoTRtAX/0W24hoWu6dmRE3t+i5YK7HXBAq+ndzZLm73eJmpH4
 nUn3e7KYGsOultzDLsjIbFp78V4iJp5zgDuwipe5z3yGSCCE27sqXjxefjeY6xGvwC2K
 kwvZugfOUYJcpInTf8fQnT225KSXzotWUrY6wqkmWs2XDaHe17QGKRihWu2RmxfexVv7
 IzZyAZxU/vSc7Mpn4Nx22e+oAJv3K0oskzqHD0xxA2ewbcaZsrbVrXBcc+sZhsaGhoaH
 Ps0hi/cDxtwKNu++Z20m0bP8uAJo7TyTQX8Un0wlaV63LdOdwpf8Xi+4aSwHtMEsYn+y
 y0qw==
X-Gm-Message-State: APjAAAW9ZojoGVrxMyveBH/x9b5wyX4B27Rufqv6dofUEHLlqX/+9Vux
 wbVIe3oDXlQWrVrTymluwVNrTbcHBVFf2AUwegJIq12rBW2u3tfvTURIreC6mydWBHNupQQ7u8u
 WHsvOOdBRl6gonbr8waAUva6z7HSfdlneBI3fyr8cqw==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr1407853qtj.344.1579555532893; 
 Mon, 20 Jan 2020 13:25:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqywvPPeh7FgOr2FVgGg2WUbLkkvTqU5itT+MWratS+JkuLjho3cX5Dq8zUicH4JEtMdHkf1hA==
X-Received: by 2002:ac8:1196:: with SMTP id d22mr1407821qtj.344.1579555532648; 
 Mon, 20 Jan 2020 13:25:32 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id f19sm16201765qkk.69.2020.01.20.13.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 13:25:31 -0800 (PST)
Date: Mon, 20 Jan 2020 16:25:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shahaf Shuler <shahafs@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200120162449-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <AM0PR0502MB3795C92485338180FC8059CFC3320@AM0PR0502MB3795.eurprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AM0PR0502MB3795C92485338180FC8059CFC3320@AM0PR0502MB3795.eurprd05.prod.outlook.com>
X-MC-Unique: 3mnxGJmVPhyx3MoG6ulHZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Parav Pandit <parav@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "Wang,
 Xiao W" <xiao.w.wang@intel.com>, "stefanha@redhat.com" <stefanha@redhat.com>,
 "Wang, Zhihong" <zhihong.wang@intel.com>,
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

On Mon, Jan 20, 2020 at 08:51:43PM +0000, Shahaf Shuler wrote:
> Monday, January 20, 2020 7:50 PM, Jason Gunthorpe:
> > Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
> > 
> > On Mon, Jan 20, 2020 at 04:43:53PM +0800, Jason Wang wrote:
> > > This is similar to the design of platform IOMMU part of vhost-vdpa. We
> > > decide to send diffs to platform IOMMU there. If it's ok to do that in
> > > driver, we can replace set_map with incremental API like map()/unmap().
> > >
> > > Then driver need to maintain rbtree itself.
> > 
> > I think we really need to see two modes, one where there is a fixed
> > translation without dynamic vIOMMU driven changes and one that supports
> > vIOMMU.
> > 
> > There are different optimization goals in the drivers for these two
> > configurations.
> 
> +1.
> It will be best to have one API for static config (i.e. mapping can be
> set only before virtio device gets active), and one API for dynamic
> changes that can be set after the virtio device is active. 

Frankly I don't see when we'd use the static one.
Memory hotplug is enabled for most guests...

> > 
> > > > If the first one, then I think memory hotplug is a heavy flow
> > > > regardless. Do you think the extra cycles for the tree traverse will
> > > > be visible in any way?
> > >
> > > I think if the driver can pause the DMA during the time for setting up
> > > new mapping, it should be fine.
> > 
> > This is very tricky for any driver if the mapping change hits the virtio rings. :(
> > 
> > Even a IOMMU using driver is going to have problems with that..
> > 
> > Jason

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

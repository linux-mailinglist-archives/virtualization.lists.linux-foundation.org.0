Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523B143383
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 22:49:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 68E2420104;
	Mon, 20 Jan 2020 21:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rc4OWbAwxglC; Mon, 20 Jan 2020 21:49:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7740B2048D;
	Mon, 20 Jan 2020 21:49:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 525B5C0174;
	Mon, 20 Jan 2020 21:49:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8A00C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C45AA81B78
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CBJncZ7wyfh
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:49:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D738681B73
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579556947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7XraG6j1N/y3xLCXP92Th/VKfxmhRZrdg4uwGLI/Vm4=;
 b=b/oGc94Ifz3dnXu4d137Zl7ENNiYvuU4emeQUlY3tMmRediIJqph43VyGgpQheQ7O2WUve
 2+BIvmKqb1SMDRfyLPEVzUmgC12oUxdqkKx0/SCyLTRKbNNcP4LI9pabEQuZ0UScWdrO+b
 20jI9Fa3fINNxj5I53n2Y+isZpXdVqY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-tH018vJ6O32-AeTxQ6LxXw-1; Mon, 20 Jan 2020 16:49:06 -0500
Received: by mail-qt1-f197.google.com with SMTP id m8so628105qta.20
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:49:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7XraG6j1N/y3xLCXP92Th/VKfxmhRZrdg4uwGLI/Vm4=;
 b=fIsAd8pKycDS/ierG1wiEEIdQYhVdExicZcqWx0VmZ7+lqQuVNeR7zMFbiz2S6dolH
 PfS4GiwEu0bbP3OTdraeah1xrP0CCmzdVje6E+0cReJn5xEvTblF6PoKX1d2TanvlWQq
 0X8MaryrbJpaHtxB5Bw7OOzdyw5ncs9jq02c44MaMfpJpPH3BwKgbfKEqvHh3BRBuL2r
 8uds+8QKl/ZshRT4nZsRn0DkD54+l+hf223mB/Y/J+wjBfMebajsxyusg8568coRfymI
 dMWP1WpCvrxKa//7VEAS5JF2IahfAP5f4ddn4iKQE0H746/uX2hEboFr5rKKsLt+t2cn
 eBEQ==
X-Gm-Message-State: APjAAAWhKpJfMmzqppK/5eY9jn//udYai4vqe2T2WChqPkKpdBeH3qS/
 48zBWsPy+qtX+ICobw5h8gK0M9ElR+QLOmdUON1oKzOnY9eapOYD87nrx42Z7vSIAggvaLJG2gS
 L8C0hBS4RgUKu7VUAgu80/4qKEo4HUvoOOV48+PUO2g==
X-Received: by 2002:ad4:478b:: with SMTP id z11mr1807820qvy.185.1579556945806; 
 Mon, 20 Jan 2020 13:49:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqxe+TaTURMeMIHCV1YM/fmBzkD8nEfrcjqkwq5BuJERHu3qsEZA9pujZr3ffzD4wXcl90YdAQ==
X-Received: by 2002:ad4:478b:: with SMTP id z11mr1807796qvy.185.1579556945609; 
 Mon, 20 Jan 2020 13:49:05 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id g18sm18570113qtc.83.2020.01.20.13.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 13:49:04 -0800 (PST)
Date: Mon, 20 Jan 2020 16:48:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200120164756-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200120174933.GB3891@mellanox.com>
X-MC-Unique: tH018vJ6O32-AeTxQ6LxXw-1
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

On Mon, Jan 20, 2020 at 05:49:39PM +0000, Jason Gunthorpe wrote:
> On Mon, Jan 20, 2020 at 04:43:53PM +0800, Jason Wang wrote:
> > This is similar to the design of platform IOMMU part of vhost-vdpa. We
> > decide to send diffs to platform IOMMU there. If it's ok to do that in
> > driver, we can replace set_map with incremental API like map()/unmap().
> > 
> > Then driver need to maintain rbtree itself.
> 
> I think we really need to see two modes, one where there is a fixed
> translation without dynamic vIOMMU driven changes and one that
> supports vIOMMU.
> 
> There are different optimization goals in the drivers for these two
> configurations.
> 
> > > If the first one, then I think memory hotplug is a heavy flow
> > > regardless. Do you think the extra cycles for the tree traverse
> > > will be visible in any way?
> > 
> > I think if the driver can pause the DMA during the time for setting up new
> > mapping, it should be fine.
> 
> This is very tricky for any driver if the mapping change hits the
> virtio rings. :(
> 
> Even a IOMMU using driver is going to have problems with that..
> 
> Jason

I think for starters we can assume this doesn't happen,
so any change doesn't affect any buffers in use.
Certainly true e.g. for memory hotplug.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

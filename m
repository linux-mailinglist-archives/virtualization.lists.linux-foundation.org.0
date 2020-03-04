Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 144581793B3
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 16:38:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA6E28798F;
	Wed,  4 Mar 2020 15:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CQId92SnEI5m; Wed,  4 Mar 2020 15:38:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B506A87937;
	Wed,  4 Mar 2020 15:38:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 927A1C013E;
	Wed,  4 Mar 2020 15:38:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 276D9C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 15:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 151F620531
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 15:38:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x52ndSAuPOv1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 15:38:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id D990D2052D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 15:38:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v2so2922223wrp.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Mar 2020 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LgKNIbiOOYUUhf9VX9b+pYwCqt61P9QUYyLGCfaRQqc=;
 b=xw8uHB+1gNxz+4nuw+2nLyDwmL1QI5esVQO6EGJsBylGKEJSkntlHBqiPkEjo6I5so
 2j2NYcXAd8eVJR5NuQBvnBohvKncJiDbZj1YRtCntDcsklLInje+Nvh3wvu6cFWPFTTS
 CWckFMsVTrr5BiBsV/nqAMSc+QBQHT/7dMW1rdOjRzfzZcIFkiFXUUHtuTmHjXvS6y2W
 3EOPNRQRVYMoR5mWF82I5IEP576nXKWDhNiThT+JDtUY8BTwBkbwMsgIpwAGppFNz4qC
 5VoJpJuo69c3oRw5Vn1DUT3/o+NcGLYRIKIbO2iJu1RLprBCPQJ+OR08RXSDt3rv8wBR
 mkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LgKNIbiOOYUUhf9VX9b+pYwCqt61P9QUYyLGCfaRQqc=;
 b=Wa+1AUJlPN0wieqVgSH+b76y12JNOweUKQ+231ccvLXGEzDuaKHEzQXL7KfXJ3LBl8
 GzuNxV+TgPy6JAO8tCZW8i1S1SUgzfTYqJAT8Y/dp4IddtxNFedB5aVDD2/MHCrPpNfe
 XSEqpyuGUfYx2DbJAHpFKTo1iH1RR4/yLlyUsYCIUV3tNxRF2DtUiM3EGKnhDd5Dqs9l
 K9bcNF2SoZX4UUir2K46YyFKwWxsoInOCTKeSwcEEPDnPnl/37PAHV+Q7CVZ0T6FBWpx
 dgfA+meU9uuqpDhI75fEmeI9+QDN5fGzEnkAZjeqWonIRbitA5wSFE8QHyqRwAUrYDH/
 XaVA==
X-Gm-Message-State: ANhLgQ1FWmgAuXbiiDoWYzARkfXMJll/5ni5iwsySaczD/gdUaeqZifj
 mR6yLI1PBoQPYLiUjVTq/e9zTw==
X-Google-Smtp-Source: ADFU+vsqYupk4jr/XDRtdoMwn9PUODaP8+a/LVXxe3xIMUBcFgnIFdwKRkeedg2yIubmDqV6LuPYEQ==
X-Received: by 2002:adf:a512:: with SMTP id i18mr4675381wrb.61.1583336308173; 
 Wed, 04 Mar 2020 07:38:28 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id g129sm5695847wmg.12.2020.03.04.07.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 07:38:27 -0800 (PST)
Date: Wed, 4 Mar 2020 16:38:21 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200304153821.GE646000@myrica>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
 <20200304133707.GB4177@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304133707.GB4177@8bytes.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Auger Eric <eric.auger@redhat.com>,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

On Wed, Mar 04, 2020 at 02:37:08PM +0100, Joerg Roedel wrote:
> Hi Michael,
> 
> On Tue, Mar 03, 2020 at 11:09:41AM -0500, Michael S. Tsirkin wrote:
> > No. It's coded into the hardware. Which might even be practical
> > for bare-metal (e.g. on-board flash), but is very practical
> > when the device is part of a hypervisor.
> 
> If its that way on PPC, than fine for them. But since this is enablement
> for x86, it should follow the x86 platform best practices, and that
> means describing hardware through ACPI.

I agree with this. The problem is I don't know how to get a new ACPI table
or change an existing one. It needs to go through the UEFI forum in order
to be accepted, and I don't have any weight there. I've been trying to get
the tiny change into IORT for ages. I haven't been given any convincing
reason against it or offered any alternative, it's just stalled. The
topology description introduced here wasn't my first choice either but
unless someone can help finding another way into ACPI, I don't have a
better idea.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

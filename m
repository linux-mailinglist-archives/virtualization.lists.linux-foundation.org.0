Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F78179915
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 20:34:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B9C1879CF;
	Wed,  4 Mar 2020 19:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgwi1zoSSm8G; Wed,  4 Mar 2020 19:34:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5565879C5;
	Wed,  4 Mar 2020 19:34:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CEFFC013E;
	Wed,  4 Mar 2020 19:34:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F01EC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0A9FD203A6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zA2wTX9bBqXi
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:34:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id AFD0420392
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583350483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVZr990W9iLEEqbjHHLM4X6TgtqyzP5bDocd/dkFa7Q=;
 b=jHXRiSev2wxWV10iQltFQ9CpPReiNf5wAB2O7YDEqHcExdNtoRbP4Rk6JeNImVvMDT/rDg
 kAUkn0n+a48AS2ICLoiv0crpoMEeWqxW+70hU/AlK1nn00H0wZmi6iIG37JLkwb5d3aqR5
 fKDcg+7US1Qanu04Bi8TZBsgaHtkzIo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-Tv-3KjzPMWeEM0IP5-eptQ-1; Wed, 04 Mar 2020 14:34:41 -0500
X-MC-Unique: Tv-3KjzPMWeEM0IP5-eptQ-1
Received: by mail-qt1-f198.google.com with SMTP id f24so2169161qte.22
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Mar 2020 11:34:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LVZr990W9iLEEqbjHHLM4X6TgtqyzP5bDocd/dkFa7Q=;
 b=R5jyNvlQ12xEoo1LRA8bE36QyirwNBrvg5Olt5IjZx+R49BMfJOekKlWh6edqsnWY0
 QViJhxyI6d7yM1k4VDzvP6mVfVjBhBubhN0Fx1bNretWTj+OfJCNFmoczXHIQckcSegq
 /EUfdR+ia3eSRbeVfnXA/+g20M7EIOTOp+SDNyr6QhnVvhU9FvVD+Xh1DueJpd20ggae
 r2MZlABAA0fAc8/mEwH5cSImhdduEfloTSAnBphwmho8itjwQ3wDUwpi9Uifq+ylhPWR
 2Ptf/QjXj9euGW7B1DZV4rglKlm53sbJ4syI1PN7iajPZcrGOO20NFHlczyJeMvYrBhm
 C8tQ==
X-Gm-Message-State: ANhLgQ14f5pm28yCJFOmKuiLpry0XzBYzIiMdoLDMOQUWqIjcr25Va5j
 OUbyhIGNRKNxMFH51iSBwmi7JjBQFzyev7hq/PLHFR/+ZVp1zKsau8lj7Loplo5/E0l8SWfZpTl
 hFfpFqhOeqUCaTdqIgcQ9Hz+szAzFTTCbflj/I1g3Aw==
X-Received: by 2002:ac8:4581:: with SMTP id l1mr3852960qtn.59.1583350481249;
 Wed, 04 Mar 2020 11:34:41 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsHn2bzjYBh7yhIwOYSFDd0efbpFoWGSCiIqYDJtY0uHAZJqjWQvAouRmL7W3iDyAP6JRkM+g==
X-Received: by 2002:ac8:4581:: with SMTP id l1mr3852927qtn.59.1583350480930;
 Wed, 04 Mar 2020 11:34:40 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id k4sm14181293qtj.74.2020.03.04.11.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 11:34:40 -0800 (PST)
Date: Wed, 4 Mar 2020 14:34:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200304142838-mutt-send-email-mst@kernel.org>
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
In-Reply-To: <20200304133707.GB4177@8bytes.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
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

For hardware, sure.  Hypervisors aren't hardware
though and a bunch of hypervisors don't use ACPI.


> > This "hardware" is actually part of hypervisor so there's no
> > reason it can't be completely self-descriptive. It's specified
> > by the same entity as the "firmware".
> 
> That is just an implementation detail. Yes, QEMU emulates the hardware
> and builds the ACPI tables. But it could also be implemented in a way
> where the ACPI tables are build by guest firmware.

All these extra levels of indirection is one of the reasons
hypervisors such as kata try to avoid ACPI.

> > I don't see why it would be much faster. The interface isn't that
> > different from command queues of VTD.
> 
> VirtIO IOMMU doesn't need to build page-tables that the hypervisor then
> has to shadow, which makes things much faster. If you emulate one of the
> other IOMMUs (VT-d or AMD-Vi) the code has to shadow the full page-table
> at once when device passthrough is used. VirtIO-IOMMU doesn't need that,
> and that makes it much faster and efficient.


IIUC VT-d at least supports range invalidations.

> 
> > Making ACPI meet the goals of embedded projects such as kata containers
> > would be a gigantic task with huge stability implications.  By
> > comparison this 400-line parser is well contained and does the job.  I
> > didn't yet see compelling reasons not to merge this, but I'll be
> > interested to see some more specific concerns.
> 
> An ACPI table parse wouldn't need more lines of code.

It realies on ACPI OSPM itself to handle ACPI bytecode, which is huge.


> For embedded
> systems there is still the DT way of describing things.

For some embedded systems.

> Regards,
> 
> 	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

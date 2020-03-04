Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0817917C
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 14:37:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F024887A5A;
	Wed,  4 Mar 2020 13:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z454iFIn3Qaz; Wed,  4 Mar 2020 13:37:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B1A85878F1;
	Wed,  4 Mar 2020 13:37:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93B05C013E;
	Wed,  4 Mar 2020 13:37:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 215BAC013E;
 Wed,  4 Mar 2020 13:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0A7F584837;
 Wed,  4 Mar 2020 13:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_s1KHe7iE9h; Wed,  4 Mar 2020 13:37:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE1E984799;
 Wed,  4 Mar 2020 13:37:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3690C3A4; Wed,  4 Mar 2020 14:37:11 +0100 (CET)
Date: Wed, 4 Mar 2020 14:37:08 +0100
From: Joerg Roedel <joro@8bytes.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200304133707.GB4177@8bytes.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303105523-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi Michael,

On Tue, Mar 03, 2020 at 11:09:41AM -0500, Michael S. Tsirkin wrote:
> No. It's coded into the hardware. Which might even be practical
> for bare-metal (e.g. on-board flash), but is very practical
> when the device is part of a hypervisor.

If its that way on PPC, than fine for them. But since this is enablement
for x86, it should follow the x86 platform best practices, and that
means describing hardware through ACPI.

> This "hardware" is actually part of hypervisor so there's no
> reason it can't be completely self-descriptive. It's specified
> by the same entity as the "firmware".

That is just an implementation detail. Yes, QEMU emulates the hardware
and builds the ACPI tables. But it could also be implemented in a way
where the ACPI tables are build by guest firmware.

> I don't see why it would be much faster. The interface isn't that
> different from command queues of VTD.

VirtIO IOMMU doesn't need to build page-tables that the hypervisor then
has to shadow, which makes things much faster. If you emulate one of the
other IOMMUs (VT-d or AMD-Vi) the code has to shadow the full page-table
at once when device passthrough is used. VirtIO-IOMMU doesn't need that,
and that makes it much faster and efficient.

> Making ACPI meet the goals of embedded projects such as kata containers
> would be a gigantic task with huge stability implications.  By
> comparison this 400-line parser is well contained and does the job.  I
> didn't yet see compelling reasons not to merge this, but I'll be
> interested to see some more specific concerns.

An ACPI table parse wouldn't need more lines of code. For embedded
systems there is still the DT way of describing things.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

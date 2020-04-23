Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E70DA1B54A0
	for <lists.virtualization@lfdr.de>; Thu, 23 Apr 2020 08:16:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8375085EBB;
	Thu, 23 Apr 2020 06:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZ3qjEqV3KzR; Thu, 23 Apr 2020 06:16:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 31C2586B96;
	Thu, 23 Apr 2020 06:16:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12D56C0175;
	Thu, 23 Apr 2020 06:16:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FEB8C0175
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 06:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4700A2041E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 06:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvnTzVtQ2HDz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 06:16:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 5911B203D4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 06:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rq+QTShohzY4Rd55RAkLg7KPowx3+3Zby0B4moCrCAY=; b=qEL7jXjdh2GSG0KAjb7y96qB1K
 wOBucwe//4VQGGg/7GXhV+gQ6CMAXoGlzwYLQ62tBi3VaGqsCf0uO3KP8q2HpxcJutrlexg0JBK4B
 sWtpnDwYuhphJSvyXGABzlVszINTd0bDteg8nSbUPAMnmlEjIYcRoqu9VN7ct/xM5vSDXaTsSkgMP
 cmg9nPEYHl9tuQuRSoyX6004eLFn+GnUuBIZanO/vhOzVCxE8K5jZkh/qgGUziwuYilR0/AALIqE7
 xlwzMQ78eqpC/siuM6wPXjkqZGqyh4YR6dDmEda21cwqxKHByclDa9fPB/sFU8QW60Z9EgDkHzOjU
 b12plF5Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jRV9z-00067g-MX; Thu, 23 Apr 2020 06:16:31 +0000
Date: Wed, 22 Apr 2020 23:16:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jon Derrick <jonathan.derrick@intel.com>
Subject: Re: [PATCH 0/1] KVM support for VMD devices
Message-ID: <20200423061631.GA12688@infradead.org>
References: <20200422171444.10992-1-jonathan.derrick@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422171444.10992-1-jonathan.derrick@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@intel.com>
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

On Wed, Apr 22, 2020 at 01:14:44PM -0400, Jon Derrick wrote:
> The two patches (Linux & QEMU) add support for passthrough VMD devices
> in QEMU/KVM. VMD device 28C0 already supports passthrough natively by
> providing the Host Physical Address in a shadow register to the guest
> for correct bridge programming.
> 
> The QEMU patch emulates the 28C0 mode by creating a shadow register and
> advertising its support by using QEMU's subsystem vendor/id.
> The Linux patch matches the QEMU subsystem vendor/id to use the shadow
> register.

Please pick a different PCI ID for Qemu vs real hardware so that we
can properly quirk them if they end up behaving differently due to
hardware or software bugs.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

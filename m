Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D134179B81
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 23:04:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 244838356F;
	Wed,  4 Mar 2020 22:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bt1U1lxPiYZp; Wed,  4 Mar 2020 22:04:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5110584138;
	Wed,  4 Mar 2020 22:04:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 428F8C013E;
	Wed,  4 Mar 2020 22:04:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4E03C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9D64D87A56
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5p7ADdycHLgy
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 22:04:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 259EB87A4F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 22:04:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id C288715AD58E7;
 Wed,  4 Mar 2020 14:04:12 -0800 (PST)
Date: Wed, 04 Mar 2020 14:04:10 -0800 (PST)
Message-Id: <20200304.140410.731261448085906331.davem@davemloft.net>
To: vithampi@vmware.com
Subject: Re: [PATCH RESEND] ptp: add VMware virtual PTP clock driver
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200228053230.GA457139@sc2-cpbu2-b0737.eng.vmware.com>
References: <20200228053230.GA457139@sc2-cpbu2-b0737.eng.vmware.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 04 Mar 2020 14:04:13 -0800 (PST)
Cc: jgross@suse.com, thellstrom@vmware.com, Pv-drivers@vmware.com,
 netdev@vger.kernel.org, richardcochran@gmail.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

From: Vivek Thampi <vithampi@vmware.com>
Date: Fri, 28 Feb 2020 05:32:46 +0000

> Add a PTP clock driver called ptp_vmw, for guests running on VMware ESXi
> hypervisor. The driver attaches to a VMware virtual device called
> "precision clock" that provides a mechanism for querying host system time.
> Similar to existing virtual PTP clock drivers (e.g. ptp_kvm), ptp_vmw
> utilizes the kernel's PTP hardware clock API to implement a clock device
> that can be used as a reference in Chrony for synchronizing guest time with
> host.
> 
> The driver is only applicable to x86 guests running in VMware virtual
> machines with precision clock virtual device present. It uses a VMware
> specific hypercall mechanism to read time from the device.
> 
> Reviewed-by: Thomas Hellstrom <thellstrom@vmware.com>
> Signed-off-by: Vivek Thampi <vithampi@vmware.com>
> ---
>  Based on feedback, resending patch to include a broader audience.

If it's just providing a read of an accurate timesource, I think it's kinda
pointless to provide a full PTP driver for it.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA0817B3BA
	for <lists.virtualization@lfdr.de>; Fri,  6 Mar 2020 02:25:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18B4A84115;
	Fri,  6 Mar 2020 01:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkiqkBVoZplO; Fri,  6 Mar 2020 01:25:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB86E87475;
	Fri,  6 Mar 2020 01:25:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91AE3C1D85;
	Fri,  6 Mar 2020 01:25:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBFA5C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 01:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C6C44221F0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 01:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HPqG6hAjZd24
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 01:25:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by silver.osuosl.org (Postfix) with ESMTPS id ECD68204C9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Mar 2020 01:25:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id B2C0815531085;
 Thu,  5 Mar 2020 17:25:41 -0800 (PST)
Date: Thu, 05 Mar 2020 17:25:39 -0800 (PST)
Message-Id: <20200305.172539.2236241791008844069.davem@davemloft.net>
To: vithampi@vmware.com
Subject: Re: [PATCH RESEND] ptp: add VMware virtual PTP clock driver
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200228053230.GA457139@sc2-cpbu2-b0737.eng.vmware.com>
References: <20200228053230.GA457139@sc2-cpbu2-b0737.eng.vmware.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 05 Mar 2020 17:25:42 -0800 (PST)
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

Thanks for your explanation of why this is a reasonable driver, makes sense.

Applied to net-next.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

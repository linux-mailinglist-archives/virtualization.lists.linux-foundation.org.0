Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 872453CF801
	for <lists.virtualization@lfdr.de>; Tue, 20 Jul 2021 12:39:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E03F40310;
	Tue, 20 Jul 2021 10:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xC3IyL3Qp0jW; Tue, 20 Jul 2021 10:39:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1DCB94030C;
	Tue, 20 Jul 2021 10:39:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A361C000E;
	Tue, 20 Jul 2021 10:39:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B847EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99F5F40293
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fOee1bDkZgwb
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:39:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 139A440236
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Jul 2021 10:39:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F12A161003;
 Tue, 20 Jul 2021 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626777562;
 bh=QsGGuhGelyCCU/3mYQaWcENxQAWsM9ZlixOi0YUBtIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NM49mNV6MLw5L/sDiP4oYyKqWayF2KFJu7IKnInh+5EaprnUq3622/Qb5fs/QEH/z
 V+OtS2mlcbDBPsyqc18osQuceZO3GzoQjZeRUtweGSRw+3PkD4NtQxMMsEw2i38jXc
 +jlltWTrstWXh0FRhlKsvg6eEnY5oqFyzorozaXg=
Date: Tue, 20 Jul 2021 12:39:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH] MAINTAINERS: Update for VMCI driver
Message-ID: <YPan14jucU9/u6JL@kroah.com>
References: <1626776941-9163-1-git-send-email-jhansen@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626776941-9163-1-git-send-email-jhansen@vmware.com>
Cc: pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Tue, Jul 20, 2021 at 03:29:01AM -0700, Jorgen Hansen wrote:
> Add maintainer info for the VMware VMCI driver.
> 
> Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a61f4f3..7e7c6fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19792,6 +19792,14 @@ L:	netdev@vger.kernel.org
>  S:	Supported
>  F:	drivers/ptp/ptp_vmw.c
>  
> +VMWARE VMCI DRIVER
> +M:	Jorgen Hansen <jhansen@vmware.com>
> +M:	Vishnu Dasa <vdasa@vmware.com>
> +M:	"VMware, Inc." <pv-drivers@vmware.com>

Please do not use generic aliases as they provide no personal
responsibility.  Just stick with real people.

Also I would need an ack from Vishnu.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

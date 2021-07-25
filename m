Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E43D4D04
	for <lists.virtualization@lfdr.de>; Sun, 25 Jul 2021 11:53:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E2E605C3;
	Sun, 25 Jul 2021 09:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F41FsK0Rv2j5; Sun, 25 Jul 2021 09:53:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB80A605DB;
	Sun, 25 Jul 2021 09:53:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C4CAC001F;
	Sun, 25 Jul 2021 09:53:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8024CC000E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 611C882F4A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EgbxpKh4qw0m
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:53:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B66BB82EFC
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 09:53:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 775FA60EB4;
 Sun, 25 Jul 2021 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627206810;
 bh=0S5mWKS0YE49dox05634DpEBe3LWGbAlibIkWC4I1Gg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lR/dgZDaAzJhrlzuBwuNvpeBE4nL0O7SwDDAu6rs0nTpn1qZEYJXmDzGlXiIJkSPi
 DEUw9XRrshACWRfm2NN+eObQOA1mI0yECh4j6vL0g937TVrxPAFKz0YkzaLvaT0fp3
 pnIqeT+ksyE4lvJlxwsLHrxLLdA2l6EPkdDNpw4OXahbwQ98vViyQuxeoQkxQaHLjy
 Q6sRvkKKrCT1QTL/rg+jvL0VggyW1G9mMEZssChTBjfJd94JWLFGqNM5/b81t0nwFu
 6VaUZIPmQfH5aIPeZe+giBPVpRNS6YwCRbQw4XZdNAmlpPurDgUKZjsxssLoV6BW+C
 gWfE2It+7QmQA==
Date: Sun, 25 Jul 2021 12:53:26 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update for VMCI driver
Message-ID: <YP00lgKjIJ6tO0tw@unreal>
References: <1626861766-11115-1-git-send-email-jhansen@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626861766-11115-1-git-send-email-jhansen@vmware.com>
Cc: pv-drivers@vmware.com, gregkh@linuxfoundation.org,
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

On Wed, Jul 21, 2021 at 03:02:46AM -0700, Jorgen Hansen wrote:
> Add maintainer info for the VMware VMCI driver.
> 
> v2: moved pv-drivers to L: as private list

Please put changelog under "---".
There is no value to see vXXX in the final commit in the repo.

Thanks

> 
> Acked-by: Vishnu Dasa <vdasa@vmware.com>
> Signed-off-by: Jorgen Hansen <jhansen@vmware.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a61f4f3..969a67a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19792,6 +19792,14 @@ L:	netdev@vger.kernel.org
>  S:	Supported
>  F:	drivers/ptp/ptp_vmw.c
>  
> +VMWARE VMCI DRIVER
> +M:	Jorgen Hansen <jhansen@vmware.com>
> +M:	Vishnu Dasa <vdasa@vmware.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	pv-drivers@vmware.com (private)
> +S:	Maintained
> +F:	drivers/misc/vmw_vmci/
> +
>  VMWARE VMMOUSE SUBDRIVER
>  M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
>  M:	"VMware, Inc." <pv-drivers@vmware.com>
> -- 
> 2.6.2
> 
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

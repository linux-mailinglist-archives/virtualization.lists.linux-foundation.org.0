Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 108D93312CB
	for <lists.virtualization@lfdr.de>; Mon,  8 Mar 2021 17:03:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 545D9400E7;
	Mon,  8 Mar 2021 16:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFNhRyorYrv0; Mon,  8 Mar 2021 16:03:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64618400EC;
	Mon,  8 Mar 2021 16:03:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CBC3C0001;
	Mon,  8 Mar 2021 16:03:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F714C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 16:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F2A9400E2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 16:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AMBDocJCDX7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 16:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B56AC400E3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Mar 2021 16:03:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9875065210;
 Mon,  8 Mar 2021 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615219424;
 bh=PBmEbgMiN3pUGiaxEnpqYz1pmhYI5EG78UjJ+zTCa34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NcWexvUdUGzNuljFAKt4fG1oCKJyzBczFAtB8+g0gDNqIo3suCYS8hcUyItWj1WgC
 YE5J1Wauy0loF0JQdDbudC7sEd5zCV6eYhEgKTgzx4mCxoCQD3iFCWNyrxqDP68Y1c
 MTSoyBck2RU5OWWsFfNAxjmXsvp9+7iiGnQrB8dkBh3sG1cS78DUNEbYCf3Oc3oWbL
 D3JBQ15AywqQuZ4fJyWciTSGIMZz7xhkzC4/4seW7Kog0XWj0ChEDFzah/mjXVROSo
 XylHnTySjGqGDAdgnlbBsHBNVmDcjr7z69oEMKc66j/TxKyeJcRK91KTmHZ1GedeC1
 4XTqKpPLor6ZQ==
Date: Mon, 8 Mar 2021 18:03:40 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH V2 4/4] vDPA/ifcvf: remove the version number string
Message-ID: <YEZK3JF1hdSvfIzi@unreal>
References: <20210308083525.382514-1-lingshan.zhu@intel.com>
 <20210308083525.382514-5-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308083525.382514-5-lingshan.zhu@intel.com>
Cc: lulu@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Mon, Mar 08, 2021 at 04:35:25PM +0800, Zhu Lingshan wrote:
> This commit removes the version number string, using kernel
> version is enough.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  drivers/vdpa/ifcvf/ifcvf_main.c | 2 --
>  1 file changed, 2 deletions(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

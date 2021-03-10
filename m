Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9F33387F
	for <lists.virtualization@lfdr.de>; Wed, 10 Mar 2021 10:16:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874B784391;
	Wed, 10 Mar 2021 09:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRI6Wtcg_pPe; Wed, 10 Mar 2021 09:16:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 760738439A;
	Wed, 10 Mar 2021 09:16:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13673C0001;
	Wed, 10 Mar 2021 09:16:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 108B2C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 09:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4BA384385
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-4im55thsPK
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 09:16:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D3A8436E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Mar 2021 09:16:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 247FD64F67;
 Wed, 10 Mar 2021 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615367773;
 bh=4F4UviQ0MAwWWHGmRaFTU410NI5y3UWsDtvwcmlSP2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPmwTLlrtWTu2qQuhPhBH52pvWiMC67U6RLHUy5jFd6s5KV5WISTGY82LshD7IroU
 P3CGm/60n76YpIAvfRAj4De7EnEiyj45rrhpMhyVwoo3FJVJYIiuVve5WeXS6PfN+v
 vucVqHnGJ36woeUDu2CljqJKgqdNTCYVcKmF5pVjbUaTtoStsfD9iRndJSbcJP46/D
 ykkfDHqnuDiZfFKDOPT+KNVS3zkiddTsGadEMt7Haio1eSHWVhlykg5DHC3BD2sOqy
 GW784CMMmtKIZFv5qqzkMPK4LkB6lCMisjNCFnXNx9r4WNbzrtfvVZ02ExxIC/5RC/
 sWzWsne7OPVqg==
Date: Wed, 10 Mar 2021 11:16:09 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH V3 4/6] vDPA/ifcvf: remove the version number string
Message-ID: <YEiOWd9jXHnw4b11@unreal>
References: <20210310090052.4762-1-lingshan.zhu@intel.com>
 <20210310090052.4762-5-lingshan.zhu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310090052.4762-5-lingshan.zhu@intel.com>
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

On Wed, Mar 10, 2021 at 05:00:50PM +0800, Zhu Lingshan wrote:
> This commit removes the version number string, using kernel
> version is enough.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> ---
>  drivers/vdpa/ifcvf/ifcvf_main.c | 2 --
>  1 file changed, 2 deletions(-)
>

I already added my ROB, but will add again.

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

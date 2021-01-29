Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 04ADB308A31
	for <lists.virtualization@lfdr.de>; Fri, 29 Jan 2021 17:24:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A8C1222FB9;
	Fri, 29 Jan 2021 16:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-UaHsikNtup; Fri, 29 Jan 2021 16:24:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 18DBA22654;
	Fri, 29 Jan 2021 16:24:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1DCCC013A;
	Fri, 29 Jan 2021 16:24:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3977DC013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 16:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1AD7F22654
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 16:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjJNgaAkyHft
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 16:24:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C88220408
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 Jan 2021 16:24:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0FC164DFB;
 Fri, 29 Jan 2021 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611937470;
 bh=rX//8lmNsK9ouUWLaFuelzOZswldJFRqZnwM9SrzbmA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rIdEcRXyknFPg6vCzipnjyc/WTpKmyVlmoOuN2YwQwtLSqPW+EJuS+WD4+mmtmLKX
 5gwOC0Z/ybiPmQnrOTa5DIRP0EqAkElggSbcll5Mb43sr62i2YUhpexHQULXJat2jy
 t8gzwcPAlLkFM/HjstxhS06O3sImop4QIX3GpQsMvn/XvnpP0qeTH6ccTQeGbsJFiT
 43ospAl2b7n4fvB5j2fjm+yxiWBJePUJtikrT7XbZEOnXC501ZBbw0lCpbTd01mHZG
 8npsCU1Y65UT2PgkQ3xfqqvnU5/rvG4k1Qx5v6xqT3b0Q+eY0XRk4h9Z2RwE7u356y
 534BjZuz4AGww==
Date: Fri, 29 Jan 2021 10:24:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Luca Coelho <luciano.coelho@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] Fix "ordering" comment typos
Message-ID: <20210129162428.GA85218@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126195042.2909405-1-helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-wireless@vger.kernel.org,
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

On Tue, Jan 26, 2021 at 01:50:42PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Fix comment typos in "ordering".
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  arch/s390/include/asm/facility.h             | 2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                | 2 +-
>  drivers/net/wireless/intel/iwlwifi/fw/file.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> 
> Unless somebody objects, I'll just merge these typo fixes via the PCI tree.

Applied to pci/misc for v5.12 with acks from Kalle and Vasily.

> diff --git a/arch/s390/include/asm/facility.h b/arch/s390/include/asm/facility.h
> index 68c476b20b57..91b5d714d28f 100644
> --- a/arch/s390/include/asm/facility.h
> +++ b/arch/s390/include/asm/facility.h
> @@ -44,7 +44,7 @@ static inline int __test_facility(unsigned long nr, void *facilities)
>  }
>  
>  /*
> - * The test_facility function uses the bit odering where the MSB is bit 0.
> + * The test_facility function uses the bit ordering where the MSB is bit 0.
>   * That makes it easier to query facility bits with the bit number as
>   * documented in the Principles of Operation.
>   */
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 6e7f16f4cec7..dab190a547cc 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -141,7 +141,7 @@ static void qxl_drm_release(struct drm_device *dev)
>  
>  	/*
>  	 * TODO: qxl_device_fini() call should be in qxl_pci_remove(),
> -	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
> +	 * reordering qxl_modeset_fini() + qxl_device_fini() calls is
>  	 * non-trivial though.
>  	 */
>  	qxl_modeset_fini(qdev);
> diff --git a/drivers/net/wireless/intel/iwlwifi/fw/file.h b/drivers/net/wireless/intel/iwlwifi/fw/file.h
> index 597bc88479ba..04fbfe5cbeb0 100644
> --- a/drivers/net/wireless/intel/iwlwifi/fw/file.h
> +++ b/drivers/net/wireless/intel/iwlwifi/fw/file.h
> @@ -866,7 +866,7 @@ struct iwl_fw_dbg_trigger_time_event {
>   * tx_bar: tid bitmap to configure on what tid the trigger should occur
>   *	when a BAR is send (for an Rx BlocAck session).
>   * frame_timeout: tid bitmap to configure on what tid the trigger should occur
> - *	when a frame times out in the reodering buffer.
> + *	when a frame times out in the reordering buffer.
>   */
>  struct iwl_fw_dbg_trigger_ba {
>  	__le16 rx_ba_start;
> -- 
> 2.25.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B6158048
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 17:57:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 920B220027;
	Mon, 10 Feb 2020 16:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnaCspjlGW2t; Mon, 10 Feb 2020 16:57:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7C22E1FC94;
	Mon, 10 Feb 2020 16:57:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58F98C0171;
	Mon, 10 Feb 2020 16:57:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80F54C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6EC4220027
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T6cfjfaHsUxu
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:57:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 794B01FC94
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T30a/zt6Cn6nKQ6fTutzYa0Woqo49baFfIQ5xetTNbg=; b=KbA7NFnA+Iak9HzGODGtmI67nV
 zzWy8XAZ9IjcYQRS6sy37wHh8BxJ8JhZ9A2PGV1auv5X6GtsNUHCJa5jkW2DvlY2oI0eRKlRmxucl
 G6kNV9elUgofZHB+p5/sgWD4ApVnpjZXnadqFsKBFMM5Wdc/a2wWvUaT8XesBblwgXrcN5czw5Nmm
 /m6RlptS5QtiMl5ZiYQp+A6yMtN4Rmh6w4AU8vaLyOub9AeUyfzCdfeuuO0SZIZerz1HyFwul8XzW
 ++EX4xPdaSFMXi6+38U5TbzMHIE2P9y87XwDJuBsVSrKY5aysVbbk0s3VcXEMoU+wBnIt0juJGQcZ
 OBzGCqnw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61327
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1j1CNX-00079T-R0; Mon, 10 Feb 2020 17:57:47 +0100
Subject: Re: [PATCH v2 2/2] drm/qxl: add drm_driver.release callback.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
References: <20200210113753.5614-1-kraxel@redhat.com>
 <20200210113753.5614-3-kraxel@redhat.com>
 <20200210150633.GS43062@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f83001ab-8017-0576-69fd-d5f62bda84fd@tronnes.org>
Date: Mon, 10 Feb 2020 17:57:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210150633.GS43062@phenom.ffwll.local>
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



Den 10.02.2020 16.06, skrev Daniel Vetter:
> On Mon, Feb 10, 2020 at 12:37:52PM +0100, Gerd Hoffmann wrote:
>> Move final cleanups to qxl_drm_release() callback.
>> Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  drivers/gpu/drm/qxl/qxl_drv.c | 26 +++++++++++++++++++-------
>>  1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
>> index 1d601f57a6ba..4fda3f9b29f4 100644
>> --- a/drivers/gpu/drm/qxl/qxl_drv.c
>> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
>> @@ -34,6 +34,7 @@
>>  #include <linux/pci.h>
>>  
>>  #include <drm/drm.h>
>> +#include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_modeset_helper.h>
>> @@ -132,21 +133,30 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	return ret;
>>  }
>>  
>> +static void qxl_drm_release(struct drm_device *dev)
>> +{
>> +	struct qxl_device *qdev = dev->dev_private;
>> +
>> +	/*
>> +	 * TODO: qxl_device_fini() call should be in qxl_pci_remove(),
>> +	 * reodering qxl_modeset_fini() + qxl_device_fini() calls is
>> +	 * non-trivial though.
>> +	 */
>> +	qxl_modeset_fini(qdev);
> 
> So the drm_mode_config_cleanup call in here belongs in ->release, but the
> qxl_destroy_monitors_object feels like should be perfectly fine in the
> remove hook. You might need to sprinkle a few drm_dev_enter/exit around to
> protect code paths thought.
> 
> Aside from this lgtm, for the series
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> And up to you whether you want to fix this or not really.
> 
> Btw for testing all these patches that add a ->release hook I think it'd
> be good if the drm core checks that drm_device->dev is set to NULL, and
> that we do this in the remove hook. Since that's guaranteed to be gone at
> that point, so anything in ->release that still needs the device is
> broken. Ofc maybe do that check only for drivers which have a ->release
> hook, and we might need a few fixups.
> 

We take a ref on the parent device in drm_dev_init() and release it in
drm_dev_fini(). I added this because of the DRM_DEV_* macros we have, to
protect access to the device struct after it was unregistered. Setting
drm_device->dev to NULL in drm_dev_unregister() instead will provide the
same protection I think.

commit 56be6503aab2
drm/drv: Hold ref on parent device during drm_device lifetime

Noralf.

> Cheers, Daniel
> 
>> +	qxl_device_fini(qdev);
>> +	dev->dev_private = NULL;
>> +	kfree(qdev);
>> +}
>> +
>>  static void
>>  qxl_pci_remove(struct pci_dev *pdev)
>>  {
>>  	struct drm_device *dev = pci_get_drvdata(pdev);
>> -	struct qxl_device *qdev = dev->dev_private;
>>  
>>  	drm_dev_unregister(dev);
>> -
>> -	qxl_modeset_fini(qdev);
>> -	qxl_device_fini(qdev);
>> +	drm_atomic_helper_shutdown(dev);
>>  	if (is_vga(pdev))
>>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
>> -
>> -	dev->dev_private = NULL;
>> -	kfree(qdev);
>>  	drm_dev_put(dev);
>>  }
>>  
>> @@ -279,6 +289,8 @@ static struct drm_driver qxl_driver = {
>>  	.major = 0,
>>  	.minor = 1,
>>  	.patchlevel = 0,
>> +
>> +	.release = qxl_drm_release,
>>  };
>>  
>>  static int __init qxl_init(void)
>> -- 
>> 2.18.1
>>
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA86B70F
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 08:59:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D49EBC58;
	Wed, 17 Jul 2019 06:59:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1579AC2C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:59:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800075.outbound.protection.outlook.com [40.107.80.75])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A50EA25A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:59:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=W8fz0FTeST5C5XqEHkJb8dT1basy8hqh01u4DJ/Ox0u3RJ87R29iiPgZyRRIwquQ+a9krjtvvjjTG7tVrfN1E2YROVjHHg075d/XuGTeiNB09e67Ba/hSdHymZMWst15rir98B17fyqGcfBeyCb6xZbL0nMkCWgjgYGWRcmyVhG3FzE2tUWIdl3ph+Wn8sLt9eMWtA+5U0g+N0nL6FONBOf8xcep2NcHpK/G7fqV/GThbZApBbqRcoRS9JqTOvnY/RfVQWjobu2ouKcWiPrQ83gI/S7Mw96qwlC/2/clCp8eTpS/Ullz3zqxJB9Y+DEmKkOUYC+2g/mvNvrZmTmGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nrfZFP0hZDOaFnYCRQwbfT9gTwR3cNCZAY+aVxan+js=;
	b=Ah0IMUcQ16VIKjoVMMvTaQNv6Vya7g0oL9MulZXf9Qf9dBIO9p/+Baq6V46F8nuAzhQ88J0RAFg18In82y/NeSZsm3jYnV2xRzeitaYBC3783N65tKWtiqW60tqhRwOJYsk7ji8q9c55MXSDsCH9aaBlCVsJIWHBK0UZJWDa+zgfvSU8Y99/gJD3+Mqgd2im3iPoHNgypLy3GCSGTEyF8fPR9896UMqh8snRAwqE3YMyDeWPdQ74RFqkTfu5kJdmIL9OIMuhiYCqg7+4pf5ESt0iSK1TuFYUSYdEioutZ8vstdxjxFGplhAIjkp3zTGOzhecE+DFKGwZeBMEI2KPpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nrfZFP0hZDOaFnYCRQwbfT9gTwR3cNCZAY+aVxan+js=;
	b=u6xNCMhki6BvDqKJH/etS1zI8YMpnPDBf2hxT0j7fKvmlAvLVVNWhypLT2HxOZ8hcRbJHfVW69bc7K8o2G/Ebwpen+Jy8Dk4DY7/5fVM7UGGEAEHtDMsq9zkZH8Q3IxDCNED60GrxtaD4AM7LC7IZGi9cox9o9RH3QXH9Zaeme4=
Received: from CY4PR12MB1543.namprd12.prod.outlook.com (10.172.70.20) by
	CY4PR12MB1160.namprd12.prod.outlook.com (10.168.164.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.14; Wed, 17 Jul 2019 06:59:03 +0000
Received: from CY4PR12MB1543.namprd12.prod.outlook.com
	([fe80::c8a8:e8c8:e61b:f7f8]) by
	CY4PR12MB1543.namprd12.prod.outlook.com
	([fe80::c8a8:e8c8:e61b:f7f8%4]) with mapi id 15.20.2073.012;
	Wed, 17 Jul 2019 06:59:03 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Thread-Topic: [PATCH v3 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Thread-Index: AQHVPB9oAlgibIfiCE+FZlAPuAV8M6bNhkqA
Date: Wed, 17 Jul 2019 06:59:03 +0000
Message-ID: <fc57fbc8-3b37-519b-a6e2-9714df3c7715@amd.com>
References: <20190716213746.4670-1-robdclark@gmail.com>
	<20190716213746.4670-2-robdclark@gmail.com>
In-Reply-To: <20190716213746.4670-2-robdclark@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0005.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::17)
	To CY4PR12MB1543.namprd12.prod.outlook.com
	(2603:10b6:910:c::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6678fe4f-f5b2-4f3a-e7b5-08d70a844069
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:CY4PR12MB1160; 
x-ms-traffictypediagnostic: CY4PR12MB1160:
x-microsoft-antispam-prvs: <CY4PR12MB11604A7B37D9415FD263790583C90@CY4PR12MB1160.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(366004)(376002)(199004)(189003)(66946007)(2616005)(81156014)(11346002)(476003)(66556008)(86362001)(66446008)(2501003)(64756008)(446003)(71190400001)(31696002)(102836004)(71200400001)(4326008)(81166006)(316002)(110136005)(54906003)(58126008)(8936002)(5024004)(6506007)(386003)(66476007)(5660300002)(186003)(99286004)(229853002)(31686004)(14454004)(52116002)(76176011)(25786009)(65826007)(8676002)(7736002)(478600001)(305945005)(256004)(6486002)(6512007)(7416002)(6116002)(64126003)(53936002)(6246003)(46003)(14444005)(30864003)(36756003)(65806001)(68736007)(65956001)(2906002)(6436002)(486006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1160;
	H:CY4PR12MB1543.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gLq2eUYe7IVY4xtwFiFUohdHK7Hrt8WHnnoh+nNLRQh4He8f0RFy64+4fIQg8dCxgHi6AP0qb2SfEx32YHyGkQWPqDrPCbcvr5nqSbkQX9Dpj1NY8He+WfFfvenST37pblZaVHAKwX5hcrHyIabMyLDiIa9hL/AicMlewmKpHe8+nQhT3RxjpbbGyam9smof/MHHDrTMYX5Rozm06SqTi7SfQRO/StRYkNp6uILO1OGDieUn5Wy4lCHOrQSWpOav0DkBrItow1xo9WmIhFuWa8JW+TS1sPEt/FUfvEg162tTznRuKoKelSmbGJa038c3/IqLzfIFzCkzf/Os9ikBbQ2eKNmvarD2eHxEU0xLbfeUkPYssmZS1yC0jlaD8CnSwqeOA0DKUQn0CZkPTFqneJLJasGtGkKUNn4U004tk2k=
Content-ID: <E6EDA68FB1F2154482748941D0CB311D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6678fe4f-f5b2-4f3a-e7b5-08d70a844069
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:59:03.1831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1160
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Eric Biggers <ebiggers@google.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	Imre Deak <imre.deak@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
	Eric Anholt <eric@anholt.net>, Emil Velikov <emil.velikov@collabora.com>,
	Rob Clark <robdclark@chromium.org>, "Zhou, 
	David\(ChunMing\)" <David1.Zhou@amd.com>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
	David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Dave Airlie <airlied@redhat.com>, "Sharma, 
	Deepak" <Deepak.Sharma@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	"etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	"spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, Sean Paul <sean@poorly.run>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
	Alexander" <Alexander.Deucher@amd.com>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
	Lucas Stach <l.stach@pengutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Am 16.07.19 um 23:37 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> Needed in the following patch for cache operations.

Well have you seen that those callbacks are deprecated?
>   	 * Deprecated hook in favour of &drm_gem_object_funcs.pin.

>   	 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
>

I would rather say if you want to extend something it would be better to 
switch over to the per GEM object functions first.

Regards,
Christian.

>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> v3: rebased on drm-tip
>
>   drivers/gpu/drm/drm_gem.c                   | 8 ++++----
>   drivers/gpu/drm/drm_internal.h              | 4 ++--
>   drivers/gpu/drm/drm_prime.c                 | 4 ++--
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 4 ++--
>   drivers/gpu/drm/msm/msm_drv.h               | 4 ++--
>   drivers/gpu/drm/msm/msm_gem_prime.c         | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_gem.h       | 4 ++--
>   drivers/gpu/drm/nouveau/nouveau_prime.c     | 4 ++--
>   drivers/gpu/drm/qxl/qxl_prime.c             | 4 ++--
>   drivers/gpu/drm/radeon/radeon_prime.c       | 4 ++--
>   drivers/gpu/drm/vgem/vgem_drv.c             | 4 ++--
>   include/drm/drm_drv.h                       | 5 ++---
>   12 files changed, 26 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 84689ccae885..af2549c45027 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1215,22 +1215,22 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>   		obj->dev->driver->gem_print_info(p, indent, obj);
>   }
>   
> -int drm_gem_pin(struct drm_gem_object *obj)
> +int drm_gem_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	if (obj->funcs && obj->funcs->pin)
>   		return obj->funcs->pin(obj);
>   	else if (obj->dev->driver->gem_prime_pin)
> -		return obj->dev->driver->gem_prime_pin(obj);
> +		return obj->dev->driver->gem_prime_pin(obj, dev);
>   	else
>   		return 0;
>   }
>   
> -void drm_gem_unpin(struct drm_gem_object *obj)
> +void drm_gem_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	if (obj->funcs && obj->funcs->unpin)
>   		obj->funcs->unpin(obj);
>   	else if (obj->dev->driver->gem_prime_unpin)
> -		obj->dev->driver->gem_prime_unpin(obj);
> +		obj->dev->driver->gem_prime_unpin(obj, dev);
>   }
>   
>   void *drm_gem_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index 51a2055c8f18..e64090373e3a 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -133,8 +133,8 @@ void drm_gem_release(struct drm_device *dev, struct drm_file *file_private);
>   void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>   			const struct drm_gem_object *obj);
>   
> -int drm_gem_pin(struct drm_gem_object *obj);
> -void drm_gem_unpin(struct drm_gem_object *obj);
> +int drm_gem_pin(struct drm_gem_object *obj, struct device *dev);
> +void drm_gem_unpin(struct drm_gem_object *obj, struct device *dev);
>   void *drm_gem_vmap(struct drm_gem_object *obj);
>   void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
>   
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 189d980402ad..126860432ff9 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -575,7 +575,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	return drm_gem_pin(obj);
> +	return drm_gem_pin(obj, attach->dev);
>   }
>   EXPORT_SYMBOL(drm_gem_map_attach);
>   
> @@ -593,7 +593,7 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	drm_gem_unpin(obj);
> +	drm_gem_unpin(obj, attach->dev);
>   }
>   EXPORT_SYMBOL(drm_gem_map_detach);
>   
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index a05292e8ed6f..67e69a5f00f2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -43,7 +43,7 @@ int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>   	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
>   }
>   
> -int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
> +int etnaviv_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	if (!obj->import_attach) {
>   		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
> @@ -55,7 +55,7 @@ int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
>   	return 0;
>   }
>   
> -void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
> +void etnaviv_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	if (!obj->import_attach) {
>   		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ee7b512dc158..0eea68618b68 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -288,8 +288,8 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>   struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>   		struct dma_buf_attachment *attach, struct sg_table *sg);
> -int msm_gem_prime_pin(struct drm_gem_object *obj);
> -void msm_gem_prime_unpin(struct drm_gem_object *obj);
> +int msm_gem_prime_pin(struct drm_gem_object *obj, struct device *dev);
> +void msm_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev);
>   void *msm_gem_get_vaddr(struct drm_gem_object *obj);
>   void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
>   void msm_gem_put_vaddr(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 5d64e0671f7a..cc07bf94e206 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -47,14 +47,14 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
>   	return msm_gem_import(dev, attach->dmabuf, sg);
>   }
>   
> -int msm_gem_prime_pin(struct drm_gem_object *obj)
> +int msm_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	if (!obj->import_attach)
>   		msm_gem_get_pages(obj);
>   	return 0;
>   }
>   
> -void msm_gem_prime_unpin(struct drm_gem_object *obj)
> +void msm_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	if (!obj->import_attach)
>   		msm_gem_put_pages(obj);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
> index fe39998f65cc..91dcf89138f1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
> @@ -32,9 +32,9 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
>   extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
>   				  struct drm_file *);
>   
> -extern int nouveau_gem_prime_pin(struct drm_gem_object *);
> +extern int nouveau_gem_prime_pin(struct drm_gem_object *, struct device *);
>   struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *);
> -extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
> +extern void nouveau_gem_prime_unpin(struct drm_gem_object *, struct device *);
>   extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
>   extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
>   	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index 1fefc93af1d7..dec2d5e37b34 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -88,7 +88,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>   	return &nvbo->gem;
>   }
>   
> -int nouveau_gem_prime_pin(struct drm_gem_object *obj)
> +int nouveau_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>   	int ret;
> @@ -101,7 +101,7 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>   	return 0;
>   }
>   
> -void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> +void nouveau_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
> index 7d3816fca5a8..21e9b44eb2e4 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -28,14 +28,14 @@
>   /* Empty Implementations as there should not be any other driver for a virtual
>    * device that might share buffers with qxl */
>   
> -int qxl_gem_prime_pin(struct drm_gem_object *obj)
> +int qxl_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   
>   	return qxl_bo_pin(bo);
>   }
>   
> -void qxl_gem_prime_unpin(struct drm_gem_object *obj)
> +void qxl_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index deaffce50a2e..f3442bd860f6 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -83,7 +83,7 @@ struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
>   	return &bo->gem_base;
>   }
>   
> -int radeon_gem_prime_pin(struct drm_gem_object *obj)
> +int radeon_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct radeon_bo *bo = gem_to_radeon_bo(obj);
>   	int ret = 0;
> @@ -101,7 +101,7 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
>   	return ret;
>   }
>   
> -void radeon_gem_prime_unpin(struct drm_gem_object *obj)
> +void radeon_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct radeon_bo *bo = gem_to_radeon_bo(obj);
>   	int ret = 0;
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 76d95b5e289c..e7d12e93b1f0 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -307,7 +307,7 @@ static void vgem_unpin_pages(struct drm_vgem_gem_object *bo)
>   	mutex_unlock(&bo->pages_lock);
>   }
>   
> -static int vgem_prime_pin(struct drm_gem_object *obj)
> +static int vgem_prime_pin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>   	long n_pages = obj->size >> PAGE_SHIFT;
> @@ -325,7 +325,7 @@ static int vgem_prime_pin(struct drm_gem_object *obj)
>   	return 0;
>   }
>   
> -static void vgem_prime_unpin(struct drm_gem_object *obj)
> +static void vgem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
>   {
>   	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>   
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index b33f2cee2099..2b3d79bde6e1 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -592,20 +592,19 @@ struct drm_driver {
>   	 */
>   	struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
>   				struct dma_buf *dma_buf);
> -
>   	/**
>   	 * @gem_prime_pin:
>   	 *
>   	 * Deprecated hook in favour of &drm_gem_object_funcs.pin.
>   	 */
> -	int (*gem_prime_pin)(struct drm_gem_object *obj);
> +	int (*gem_prime_pin)(struct drm_gem_object *obj, struct device *dev);
>   
>   	/**
>   	 * @gem_prime_unpin:
>   	 *
>   	 * Deprecated hook in favour of &drm_gem_object_funcs.unpin.
>   	 */
> -	void (*gem_prime_unpin)(struct drm_gem_object *obj);
> +	void (*gem_prime_unpin)(struct drm_gem_object *obj, struct device *dev);
>   
>   
>   	/**

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

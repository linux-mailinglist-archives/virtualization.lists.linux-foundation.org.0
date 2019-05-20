Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DD02411E
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 21:25:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7792DCC9;
	Mon, 20 May 2019 19:24:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B42B6CC3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 19:24:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8370D879
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 19:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sagRfYYw750K/hw7qnMs91rXV+J453hYJmQBvLe2wRQ=;
	b=jJPMF8K3y2ED0Ne6B2Eli2itTHFp5nKVrSZFratr/86eA7yKu8a++Ly5RhNOokAXdDT5oEFkfOyMjJ3uhxEYyjeHE9uOWBcNqvGlXrY06G3vaE/2x8enS5MSKC1bSpS0bCHV8ml1ty07UMzHMeHcSGJacNrykd0VJ11Av7sFULY=
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
	DM5PR12MB2565.namprd12.prod.outlook.com (52.132.141.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1900.16; Mon, 20 May 2019 19:24:47 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
	([fe80::e1b1:5b6f:b2df:afa5]) by
	DM5PR12MB1546.namprd12.prod.outlook.com
	([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.020;
	Mon, 20 May 2019 19:24:47 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
	convert mgag200
Thread-Topic: [PATCH 1/2] drm: Add drm_gem_vram_{pin/unpin}_reserved() and
	convert mgag200
Thread-Index: AQHVDARQSCeRfvcxjEmmmDSoQZz2+6Z0N24AgAACBoCAADHVAA==
Date: Mon, 20 May 2019 19:24:46 +0000
Message-ID: <2192d545-47ef-ccd8-d0b9-44f42b55e8d2@amd.com>
References: <20190516162746.11636-1-tzimmermann@suse.de>
	<20190516162746.11636-2-tzimmermann@suse.de>
	<20190520161900.GB21222@phenom.ffwll.local>
	<20190520162615.GD21222@phenom.ffwll.local>
In-Reply-To: <20190520162615.GD21222@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0902CA0022.eurprd09.prod.outlook.com
	(2603:10a6:200:9b::32) To DM5PR12MB1546.namprd12.prod.outlook.com
	(2603:10b6:4:8::23)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8baf7d04-c0cf-41a8-ff7a-08d6dd58d18f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:DM5PR12MB2565; 
x-ms-traffictypediagnostic: DM5PR12MB2565:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB25651930825C25C9C24D9F1483060@DM5PR12MB2565.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39860400002)(376002)(346002)(366004)(189003)(199004)(7736002)(46003)(86362001)(229853002)(65956001)(31696002)(476003)(446003)(14444005)(256004)(31686004)(36756003)(6436002)(68736007)(587094005)(305945005)(6306002)(386003)(6506007)(71200400001)(71190400001)(65826007)(486006)(6246003)(5660300002)(102836004)(7416002)(6486002)(11346002)(65806001)(2616005)(6512007)(478600001)(186003)(76176011)(966005)(66446008)(53936002)(58126008)(66476007)(64756008)(110136005)(72206003)(81166006)(52116002)(66946007)(73956011)(81156014)(6116002)(66556008)(8936002)(316002)(54906003)(14454004)(4326008)(64126003)(53386004)(8676002)(2906002)(99286004)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2565;
	H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eKlQzaJUId01sdXzNdeqFYpAmzmMttT9FrwxXDgCzsq29osWZuzfgO3KcPvS/qcExrULbS66uqX+SwhfNgn/pfn0S+ee6R7w0GEBRxvtRa6cGwyopFMk2s8is1eDH+mfp6QQQBtSgChCB5yXjlKK3q1lv37SF5JkYMOvlW2kcb6bxx2dWxkESZvIUIodIBKpWckFP5VfpRLqRibJKgMwAFGJ+LnhHA983zB54Cz/VRCS4nQBwdJMHKqmJY4/lTHj0/+CD8p9Z+VUup/Wuk+oIdGJsXAf4WZtsiqgLFDQIf6caRd9Oei+B3rsS3yi8/7cyPeh0iSOw/lg0kqH0ntZysYCZurHxRdibrnEGrfF/uT2MpJqs9K43mNFe0uJvlMsTCxoGDYotDC8g0kZ2QmzKDZP7CQDbvoDuM0nSLMqGVo=
Content-ID: <9F5A729C26182843AFF671995E941236@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8baf7d04-c0cf-41a8-ff7a-08d6dd58d18f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 19:24:46.8915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2565
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "noralf@tronnes.org" <noralf@tronnes.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"puck.chen@hisilicon.com" <puck.chen@hisilicon.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"z.liuxinliang@hisilicon.com" <z.liuxinliang@hisilicon.com>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>,
	"kong.kongxinwei@hisilicon.com" <kong.kongxinwei@hisilicon.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"zourongrong@gmail.com" <zourongrong@gmail.com>,
	"sam@ravnborg.org" <sam@ravnborg.org>
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

Am 20.05.19 um 18:26 schrieb Daniel Vetter:
> [CAUTION: External Email]
>
> On Mon, May 20, 2019 at 06:19:00PM +0200, Daniel Vetter wrote:
>> On Thu, May 16, 2019 at 06:27:45PM +0200, Thomas Zimmermann wrote:
>>> The new interfaces drm_gem_vram_{pin/unpin}_reserved() are variants of the
>>> GEM VRAM pin/unpin functions that do not reserve the BO during validation.
>>> The mgag200 driver requires this behavior for its cursor handling. The
>>> patch also converts the driver to use the new interfaces.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/drm_gem_vram_helper.c    | 75 ++++++++++++++++++++++++
>>>   drivers/gpu/drm/mgag200/mgag200_cursor.c | 18 +++---
>>>   include/drm/drm_gem_vram_helper.h        |  3 +
>>>   3 files changed, 88 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> index 8f142b810eb4..a002c03eaf4c 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -254,6 +254,47 @@ int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag)
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_vram_pin);
>>>
>>> +/**
>>> + * drm_gem_vram_pin_reserved() - Pins a GEM VRAM object in a region.
>>> + * @gbo:   the GEM VRAM object
>>> + * @pl_flag:       a bitmask of possible memory regions
>>> + *
>>> + * Pinning a buffer object ensures that it is not evicted from
>>> + * a memory region. A pinned buffer object has to be unpinned before
>>> + * it can be pinned to another region.
>>> + *
>>> + * This function pins a GEM VRAM object that has already been
>>> + * reserved. Use drm_gem_vram_pin() if possible.
>>> + *
>>> + * Returns:
>>> + * 0 on success, or
>>> + * a negative error code otherwise.
>>> + */
>>> +int drm_gem_vram_pin_reserved(struct drm_gem_vram_object *gbo,
>>> +                         unsigned long pl_flag)
>>> +{
>>> +   int i, ret;
>>> +   struct ttm_operation_ctx ctx = { false, false };
>> I think would be good to have a lockdep_assert_held here for the ww_mutex.
>>
>> Also general thing: _reserved is kinda ttm lingo, for dma-buf reservations
>> we call the structure tracking the fences+lock the "reservation", but the
>> naming scheme used is _lock/_unlock.
>>
>> I think would be good to be consistent with that, and use _locked here.
>> Especially for a very simplified vram helper like this one I expect that's
>> going to lead to less wtf moments by driver writers :-)
>>
>> Maybe we should also do a large-scale s/reserve/lock/ within ttm, to align
>> more with what we now have in dma-buf.
> More aside:
>
> Could be a good move to demidlayer this an essentially remove
> ttm_bo_reserve as a wrapper around the linux/reservation.h functions. Not
> sure whether that aligns with Christian's plans. TODO.rst patch might be a
> good step to get that discussion started.

Well what ttm_bo_reserve()/_unreserve() does is a) lock/unlock the 
reservation object and b) remove the BO from the LRU.

Since I'm desperately trying to get rid of the LRU removal right now we 
sooner or later should be able to remove ttmo_bo_reserve()/_unreserve() 
as well (or at least replace them with tiny ttm_bo_lock() wrappers.

Christian.

> -Daniel
>
>> Cheers, Daniel
>>
>>> +
>>> +   if (gbo->pin_count) {
>>> +           ++gbo->pin_count;
>>> +           return 0;
>>> +   }
>>> +
>>> +   drm_gem_vram_placement(gbo, pl_flag);
>>> +   for (i = 0; i < gbo->placement.num_placement; ++i)
>>> +           gbo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
>>> +
>>> +   ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
>>> +   if (ret < 0)
>>> +           return ret;
>>> +
>>> +   gbo->pin_count = 1;
>>> +
>>> +   return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_vram_pin_reserved);
>>> +
>>>   /**
>>>    * drm_gem_vram_unpin() - Unpins a GEM VRAM object
>>>    * @gbo:   the GEM VRAM object
>>> @@ -285,6 +326,40 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>>>   }
>>>   EXPORT_SYMBOL(drm_gem_vram_unpin);
>>>
>>> +/**
>>> + * drm_gem_vram_unpin_reserved() - Unpins a GEM VRAM object
>>> + * @gbo:   the GEM VRAM object
>>> + *
>>> + * This function unpins a GEM VRAM object that has already been
>>> + * reserved. Use drm_gem_vram_unpin() if possible.
>>> + *
>>> + * Returns:
>>> + * 0 on success, or
>>> + * a negative error code otherwise.
>>> + */
>>> +int drm_gem_vram_unpin_reserved(struct drm_gem_vram_object *gbo)
>>> +{
>>> +   int i, ret;
>>> +   struct ttm_operation_ctx ctx = { false, false };
>>> +
>>> +   if (WARN_ON_ONCE(!gbo->pin_count))
>>> +           return 0;
>>> +
>>> +   --gbo->pin_count;
>>> +   if (gbo->pin_count)
>>> +           return 0;
>>> +
>>> +   for (i = 0; i < gbo->placement.num_placement ; ++i)
>>> +           gbo->placements[i].flags &= ~TTM_PL_FLAG_NO_EVICT;
>>> +
>>> +   ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
>>> +   if (ret < 0)
>>> +           return ret;
>>> +
>>> +   return 0;
>>> +}
>>> +EXPORT_SYMBOL(drm_gem_vram_unpin_reserved);
>>> +
>>>   /**
>>>    * drm_gem_vram_push_to_system() - \
>>>      Unpins a GEM VRAM object and moves it to system memory
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
>>> index 6c1a9d724d85..1c4fc85315a0 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
>>> @@ -23,9 +23,9 @@ static void mga_hide_cursor(struct mga_device *mdev)
>>>      WREG8(MGA_CURPOSXL, 0);
>>>      WREG8(MGA_CURPOSXH, 0);
>>>      if (mdev->cursor.pixels_1->pin_count)
>>> -           drm_gem_vram_unpin(mdev->cursor.pixels_1);
>>> +           drm_gem_vram_unpin_reserved(mdev->cursor.pixels_1);
>>>      if (mdev->cursor.pixels_2->pin_count)
>>> -           drm_gem_vram_unpin(mdev->cursor.pixels_2);
>>> +           drm_gem_vram_unpin_reserved(mdev->cursor.pixels_2);
>>>   }
>>>
>>>   int mga_crtc_cursor_set(struct drm_crtc *crtc,
>>> @@ -96,26 +96,28 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
>>>
>>>      /* Move cursor buffers into VRAM if they aren't already */
>>>      if (!pixels_1->pin_count) {
>>> -           ret = drm_gem_vram_pin(pixels_1, DRM_GEM_VRAM_PL_FLAG_VRAM);
>>> +           ret = drm_gem_vram_pin_reserved(pixels_1,
>>> +                                           DRM_GEM_VRAM_PL_FLAG_VRAM);
>>>              if (ret)
>>>                      goto out1;
>>>              gpu_addr = drm_gem_vram_offset(pixels_1);
>>>              if (gpu_addr < 0) {
>>> -                   drm_gem_vram_unpin(pixels_1);
>>> +                   drm_gem_vram_unpin_reserved(pixels_1);
>>>                      goto out1;
>>>              }
>>>              mdev->cursor.pixels_1_gpu_addr = gpu_addr;
>>>      }
>>>      if (!pixels_2->pin_count) {
>>> -           ret = drm_gem_vram_pin(pixels_2, DRM_GEM_VRAM_PL_FLAG_VRAM);
>>> +           ret = drm_gem_vram_pin_reserved(pixels_2,
>>> +                                           DRM_GEM_VRAM_PL_FLAG_VRAM);
>>>              if (ret) {
>>> -                   drm_gem_vram_unpin(pixels_1);
>>> +                   drm_gem_vram_unpin_reserved(pixels_1);
>>>                      goto out1;
>>>              }
>>>              gpu_addr = drm_gem_vram_offset(pixels_2);
>>>              if (gpu_addr < 0) {
>>> -                   drm_gem_vram_unpin(pixels_1);
>>> -                   drm_gem_vram_unpin(pixels_2);
>>> +                   drm_gem_vram_unpin_reserved(pixels_1);
>>> +                   drm_gem_vram_unpin_reserved(pixels_2);
>>>                      goto out1;
>>>              }
>>>              mdev->cursor.pixels_2_gpu_addr = gpu_addr;
>>> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
>>> index b056f189ba62..ff1a81761543 100644
>>> --- a/include/drm/drm_gem_vram_helper.h
>>> +++ b/include/drm/drm_gem_vram_helper.h
>>> @@ -82,7 +82,10 @@ void drm_gem_vram_unreserve(struct drm_gem_vram_object *gbo);
>>>   u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>>>   s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>>>   int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>>> +int drm_gem_vram_pin_reserved(struct drm_gem_vram_object *gbo,
>>> +                         unsigned long pl_flag);
>>>   int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
>>> +int drm_gem_vram_unpin_reserved(struct drm_gem_vram_object *gbo);
>>>   int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo);
>>>   void *drm_gem_vram_kmap_at(struct drm_gem_vram_object *gbo, bool map,
>>>                         bool *is_iomem, struct ttm_bo_kmap_obj *kmap);
>>> --
>>> 2.21.0
>>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

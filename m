Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EC190E1C27
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 15:18:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E03D7CF6;
	Wed, 23 Oct 2019 13:18:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BEFA7255
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 13:18:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 99D2A87B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 13:18:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 06:18:12 -0700
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="191826942"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 06:18:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: print a single line with device features
In-Reply-To: <20191022090533.GB11828@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191018113832.5460-1-kraxel@redhat.com>
	<20191022090533.GB11828@phenom.ffwll.local>
Date: Wed, 23 Oct 2019 16:18:06 +0300
Message-ID: <87mudreh2p.fsf@intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
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

On Tue, 22 Oct 2019, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Oct 18, 2019 at 01:38:32PM +0200, Gerd Hoffmann wrote:
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  drivers/gpu/drm/virtio/virtgpu_kms.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>> index 0b3cdb0d83b0..2f5773e43557 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>> @@ -155,16 +155,15 @@ int virtio_gpu_init(struct drm_device *dev)
>>  #ifdef __LITTLE_ENDIAN
>>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
>>  		vgdev->has_virgl_3d = true;
>> -	DRM_INFO("virgl 3d acceleration %s\n",
>> -		 vgdev->has_virgl_3d ? "enabled" : "not supported by host");
>> -#else
>> -	DRM_INFO("virgl 3d acceleration not supported by guest\n");
>>  #endif
>>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
>>  		vgdev->has_edid = true;
>> -		DRM_INFO("EDID support available.\n");
>>  	}
>>  
>> +	DRM_INFO("features: %cvirgl %cedid\n",
>> +		 vgdev->has_virgl_3d ? '+' : '-',
>> +		 vgdev->has_edid     ? '+' : '-');
>
> Maybe we should move the various yesno/onoff/enableddisabled helpers from
> i915_utils.h to drm_utils.h and use them more widely?

I'm trying to take it one step further by adding them to
include/linux/string-choice.h [1]. Maybe, uh, fourth time's the charm?

BR,
Jani.

[1] http://lore.kernel.org/r/20191023131308.9420-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

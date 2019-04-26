Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115822728
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:18:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DF2B5BB3;
	Sun, 19 May 2019 16:17:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B357E272A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Apr 2019 15:52:26 +0000 (UTC)
X-Greylist: delayed 00:09:53 by SQLgrey-1.7.6
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E1A4882A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 26 Apr 2019 15:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 945BE4391E;
	Fri, 26 Apr 2019 17:42:30 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
	unprotected) header.d=shipmail.org header.i=@shipmail.org
	header.b=Fmm8HafN; dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
	by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VuvOqvhRsIjG; Fri, 26 Apr 2019 17:42:25 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
	[155.4.205.35]) (Authenticated sender: mb878879)
	by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 65A473F2EF;
	Fri, 26 Apr 2019 17:42:24 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
	[155.4.205.35])
	by mail1.shipmail.org (Postfix) with ESMTPSA id C746036030C;
	Fri, 26 Apr 2019 17:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
	t=1556293343; bh=mJTS0CQsweYfMQdGyho/lewnbiCcAlZeP2iIfxcMNyM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=Fmm8HafNbU9b2pNnz/IT3Otk/LE5bt0Z0vyZerlU+W/EcOoSLYSsoltEqI8+HUr9z
	RYzI4Z5W3rs4woZXdEQmDeSAnNiBvCGF4gzRy+M5wTSdfj2HsJlkV+wn3sTfSaNJYT
	P2pZ93DOKTFgJmFzLiMAuqR6azUqrNPGml1i3aZU=
Subject: Re: [PATCH] Revert "drm/qxl: drop prime import/export callbacks"
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
References: <20190426053324.26443-1-kraxel@redhat.com>
	<CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
From: Thomas Hellstrom <thomas@shipmail.org>
Message-ID: <8ae152fe-7811-4de3-e26f-350650a8f992@shipmail.org>
Date: Fri, 26 Apr 2019 17:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
Content-Language: en-US
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	David Airlie <airlied@redhat.com>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 4/26/19 4:21 PM, Daniel Vetter wrote:
> On Fri, Apr 26, 2019 at 7:33 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>> This reverts commit f4c34b1e2a37d5676180901fa6ff188bcb6371f8.
>>
>> Simliar to commit a0cecc23cfcb Revert "drm/virtio: drop prime
>> import/export callbacks".  We have to do the same with qxl,
>> for the same reasons (it breaks DRI3).
>>
>> Drop the WARN_ON_ONCE().
>>
>> Fixes: f4c34b1e2a37d5676180901fa6ff188bcb6371f8
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Maybe we need some helpers for virtual drivers which only allow
> self-reimport and nothing else at all? I think there's qxl, virgl,
> vmwgfx and maybe also vbox one who could use this ... Just a quick
> idea.
> -Daniel

I think vmwgfx could, in theory, support the full range of operations,
at least for reasonably recent device versions. However, it wouldn't be 
terribly efficient since the exported dma-buf sglist would basically be 
a bounce-buffer.

/Thomas


>> ---
>>   drivers/gpu/drm/qxl/qxl_drv.c   |  4 ++++
>>   drivers/gpu/drm/qxl/qxl_prime.c | 12 ++++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
>> index 578d867a81d5..f33e349c4ec5 100644
>> --- a/drivers/gpu/drm/qxl/qxl_drv.c
>> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
>> @@ -255,10 +255,14 @@ static struct drm_driver qxl_driver = {
>>   #if defined(CONFIG_DEBUG_FS)
>>          .debugfs_init = qxl_debugfs_init,
>>   #endif
>> +       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>> +       .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>          .gem_prime_export = drm_gem_prime_export,
>>          .gem_prime_import = drm_gem_prime_import,
>>          .gem_prime_pin = qxl_gem_prime_pin,
>>          .gem_prime_unpin = qxl_gem_prime_unpin,
>> +       .gem_prime_get_sg_table = qxl_gem_prime_get_sg_table,
>> +       .gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
>>          .gem_prime_vmap = qxl_gem_prime_vmap,
>>          .gem_prime_vunmap = qxl_gem_prime_vunmap,
>>          .gem_prime_mmap = qxl_gem_prime_mmap,
>> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
>> index 8b448eca1cd9..114653b471c6 100644
>> --- a/drivers/gpu/drm/qxl/qxl_prime.c
>> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
>> @@ -42,6 +42,18 @@ void qxl_gem_prime_unpin(struct drm_gem_object *obj)
>>          qxl_bo_unpin(bo);
>>   }
>>
>> +struct sg_table *qxl_gem_prime_get_sg_table(struct drm_gem_object *obj)
>> +{
>> +       return ERR_PTR(-ENOSYS);
>> +}
>> +
>> +struct drm_gem_object *qxl_gem_prime_import_sg_table(
>> +       struct drm_device *dev, struct dma_buf_attachment *attach,
>> +       struct sg_table *table)
>> +{
>> +       return ERR_PTR(-ENOSYS);
>> +}
>> +
>>   void *qxl_gem_prime_vmap(struct drm_gem_object *obj)
>>   {
>>          struct qxl_bo *bo = gem_to_qxl_bo(obj);
>> --
>> 2.18.1
>>
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

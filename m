Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D122CDC85
	for <lists.virtualization@lfdr.de>; Thu,  3 Dec 2020 18:38:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E0AA687C67;
	Thu,  3 Dec 2020 17:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVwr1K5Jhdni; Thu,  3 Dec 2020 17:38:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E96B87CAB;
	Thu,  3 Dec 2020 17:38:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD17C0FA7;
	Thu,  3 Dec 2020 17:38:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67F6AC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4F7AE87CA8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9QJfx2V0tL6C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:37:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7CF8387C67
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=9JV3l87i7qLuKjrvGVIBLbXpO5mZxmVEIeZIIj4DDBE=; b=aj9cu+XYV8TCyhcLCZh0/WjBjV
 uYmmIxruOBzucXfBghia+f98ozsoaToftIyylqh8O4gT6AC9VGzRIaGYoU7f0agEh7aD40D87ukul
 vq/ZZP7tWjPlnuDMCvyCGwcNCEGKdetpzdCACMcHnzrVAGKQybkGU2kBP08KDZjeq3izr28Z5FQAl
 1PvYFz1q4AV3n9IaxFGX5PdYbtevBqNtzsgcGtn5byE5ZnEHbipEwY+3xFEjx3Pc7x2nV1yfTve3k
 PeIBUX4TEZMgLMOXJA1T0Ede7h70oG7xTXvyKYHNt5uDJzCBUH5nWfsDVK4sTO64CCie3utaAFlVi
 bGHnw7Nw==;
Received: from [2601:1c0:6280:3f0::1494]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kksYE-00060O-CT; Thu, 03 Dec 2020 17:37:54 +0000
Subject: Re: [PATCH v3 02/19] vdpa_sim: remove unnecessary headers inclusion
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201203170511.216407-1-sgarzare@redhat.com>
 <20201203170511.216407-3-sgarzare@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7e55ab39-afdd-f47b-55ec-a2bec4ab4cec@infradead.org>
Date: Thu, 3 Dec 2020 09:37:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201203170511.216407-3-sgarzare@redhat.com>
Content-Language: en-US
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Shahaf Shuler <shahafs@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Oren Duer <oren@nvidia.com>
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

On 12/3/20 9:04 AM, Stefano Garzarella wrote:
> Some headers are not necessary, so let's remove them to do
> some cleaning.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Hi,
What makes you say that some of these are unnecessary?

Please use Rule #1 from Documentation/process/submit-checklist.rst:

1) If you use a facility then #include the file that defines/declares
   that facility.  Don't depend on other header files pulling in ones
   that you use.


so just because it will compile without these headers being explictly
#included does not mean that you should remove them.


> ---
> v3:
> - avoided to remove some headers with structures and functions directly
>   used (device.h, slab.h, virtio_byteorder.h)[Jason]
> ---
>  drivers/vdpa/vdpa_sim/vdpa_sim.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> index 6a90fdb9cbfc..b08f28d20d8d 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -7,20 +7,10 @@
>   *
>   */
>  
> -#include <linux/init.h>

above is used by __init and __exit.

>  #include <linux/module.h>
>  #include <linux/device.h>
> -#include <linux/kernel.h>
> -#include <linux/fs.h>
> -#include <linux/poll.h>

Looks OK to remove poll.h.

>  #include <linux/slab.h>
> -#include <linux/sched.h>

Might be OK for sched.h.

> -#include <linux/wait.h>

Might be OK for wait.h.

> -#include <linux/uuid.h>
> -#include <linux/iommu.h>
>  #include <linux/dma-map-ops.h>
> -#include <linux/sysfs.h>
> -#include <linux/file.h>
>  #include <linux/etherdevice.h>
>  #include <linux/vringh.h>
>  #include <linux/vdpa.h>
> 

I didn't check the others.


-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

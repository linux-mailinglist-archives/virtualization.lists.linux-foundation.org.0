Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50E14E825
	for <lists.virtualization@lfdr.de>; Fri, 31 Jan 2020 06:13:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 019D486962;
	Fri, 31 Jan 2020 05:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qEfKb5fbS9gR; Fri, 31 Jan 2020 05:13:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8355A86946;
	Fri, 31 Jan 2020 05:13:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 656A0C0171;
	Fri, 31 Jan 2020 05:13:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A2ADC0171
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 630DA203A7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GB1D9M+kspfE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:13:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 1340F20004
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Jan 2020 05:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NVnsA3lgQnOxibe1eLWi6OoL2Yp9oede8aVfjqOqlkI=; b=RgvO7YDRDIlWCO4ilKNIMWyKB
 HXTP4o0SsAe8lqyFLX7AKBfa492GccM8ZfS7h/OPo0C4Ijhl8QomF2PI2NhL11/fyj5OzuYGwDDra
 vL6xYE1ZwmC8EudMZX0/EIMfunxANPM10WilPgnqE0wUjZUnoV9GvWImPfGYEZ0a7al5a7tnwribn
 tGJYL8wL4sWvPzr9AnjnA/0ZK6AJxJfZQtnyU0cdSOtJ725kJKLopNeLRipXOeT8pTg/URCNAOxlL
 AHnllLkOc1BOAtFbNz/MGmzr8t1B9667HWssRnzW3PNr2ZXP8kq+FHnOkG5fzaGKq0DMPw6M48HXb
 00ahJVGVg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixOc0-0004Dv-Fr; Fri, 31 Jan 2020 05:13:00 +0000
Subject: Re: [PATCH] vhost: introduce vDPA based backend
From: Randy Dunlap <rdunlap@infradead.org>
To: Tiwei Bie <tiwei.bie@intel.com>, mst@redhat.com, jasowang@redhat.com
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <43aeecb4-4c08-df3d-1c1d-699ec4c494bd@infradead.org>
Message-ID: <05e21ed9-d5af-b57c-36cd-50b34915e82d@infradead.org>
Date: Thu, 30 Jan 2020 21:12:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <43aeecb4-4c08-df3d-1c1d-699ec4c494bd@infradead.org>
Content-Language: en-US
Cc: shahafs@mellanox.com, jiri@mellanox.com, lulu@redhat.com,
 kvm@vger.kernel.org, netdev@vger.kernel.org, mhabets@solarflare.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 hch@infradead.org, eperezma@redhat.com, haotian.wang@sifive.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, maxime.coquelin@redhat.com, lingshan.zhu@intel.com,
 rob.miller@broadcom.com
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

On 1/30/20 7:56 PM, Randy Dunlap wrote:
> Hi,
> 
> On 1/30/20 7:36 PM, Tiwei Bie wrote:
>> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
>> index f21c45aa5e07..13e6a94d0243 100644
>> --- a/drivers/vhost/Kconfig
>> +++ b/drivers/vhost/Kconfig
>> @@ -34,6 +34,18 @@ config VHOST_VSOCK
>>  	To compile this driver as a module, choose M here: the module will be called
>>  	vhost_vsock.
>>  
>> +config VHOST_VDPA
>> +	tristate "Vhost driver for vDPA based backend"

oops, missed this one:
	                           vDPA-based

>> +	depends on EVENTFD && VDPA
>> +	select VHOST
>> +	default n
>> +	---help---
>> +	This kernel module can be loaded in host kernel to accelerate
>> +	guest virtio devices with the vDPA based backends.
> 
> 	                              vDPA-based
> 
>> +
>> +	To compile this driver as a module, choose M here: the module
>> +	will be called vhost_vdpa.
>> +
> 
> The preferred Kconfig style nowadays is
> (a) use "help" instead of "---help---"
> (b) indent the help text with one tab + 2 spaces
> 
> and don't use "default n" since that is already the default.
> 
>>  config VHOST
>>  	tristate
>>          depends on VHOST_IOTLB
> 
> thanks.
> 


-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845F165618
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 05:10:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 59CA384ECD;
	Thu, 20 Feb 2020 04:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAfzTXx3Y69N; Thu, 20 Feb 2020 04:10:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9116A821DB;
	Thu, 20 Feb 2020 04:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6188DC013E;
	Thu, 20 Feb 2020 04:09:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F123FC013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EA5EF878F1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oE2RbLHDuWWR
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:09:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3409E820E4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 04:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=CsxfWzTNcRqW4gQltRNanmog3EEMxaevUToNMDOBQ8w=; b=RODBwJwvlGrJzqmcQaeZc2Jm6N
 ZEuJ77jFO1YGZDUmQvQ1/r1BkPMfgZYARqUIZgUDKgaNhAr7Thex9GNa2ME8vTF6Z4JnKMYSdxlaC
 V/lecE7apa1yPaYnrCHA+R71OjdQxASztSXQsQM2gd8BjgHyIo8p5FipS996JxP81yGtzBftB7gWE
 9cps4rc3QapE0okZawwtBWhLNXzix7eM8DpXK3dWcgPehNN0wcuUNrIp62n7wwPhV9qlrLVz1Ner0
 UY5Wv9pu+5O5wt30tmtPZ9yEh+PZs3/q7SQ32VjZr22lvVQ8vaTZEq0YpE8bA/PgGDmf4Ml9mEp1w
 BJtl64rg==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4d9O-0001lJ-Kb; Thu, 20 Feb 2020 04:09:22 +0000
Subject: Re: [PATCH V3 5/5] vdpasim: vDPA device simulator
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
References: <20200220035650.7986-1-jasowang@redhat.com>
 <20200220035650.7986-6-jasowang@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ee917060-da84-e94d-df99-208100345b14@infradead.org>
Date: Wed, 19 Feb 2020 20:09:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220035650.7986-6-jasowang@redhat.com>
Content-Language: en-US
Cc: shahafs@mellanox.com, jiri@mellanox.com, lulu@redhat.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, haotian.wang@sifive.com,
 hch@infradead.org, eperezma@redhat.com, maxime.coquelin@redhat.com,
 jgg@mellanox.com, hanand@xilinx.com, parav@mellanox.com,
 zhihong.wang@intel.com, lingshan.zhu@intel.com, mhabets@solarflare.com,
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

On 2/19/20 7:56 PM, Jason Wang wrote:
> diff --git a/drivers/virtio/vdpa/Kconfig b/drivers/virtio/vdpa/Kconfig
> index 7a99170e6c30..e3656b722654 100644
> --- a/drivers/virtio/vdpa/Kconfig
> +++ b/drivers/virtio/vdpa/Kconfig
> @@ -7,3 +7,21 @@ config VDPA
>            datapath which complies with virtio specifications with
>            vendor specific control path.
>  
> +menuconfig VDPA_MENU
> +	bool "VDPA drivers"
> +	default n
> +
> +if VDPA_MENU
> +
> +config VDPA_SIM
> +	tristate "vDPA device simulator"
> +        select VDPA
> +        depends on RUNTIME_TESTING_MENU
> +        default n
> +        help
> +          vDPA networking device simulator which loop TX traffic back
> +          to RX. This device is used for testing, prototyping and
> +          development of vDPA.
> +
> +endif # VDPA_MENU
> +

Use 1 tab for indentation for tristate/select/depends/default/help,
and then 1 tab + 2 spaces for help text.

-- 
~Randy

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

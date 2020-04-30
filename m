Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C11BF5F6
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:57:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3388488672;
	Thu, 30 Apr 2020 10:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSTL856Lfuo9; Thu, 30 Apr 2020 10:57:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0E26883B2;
	Thu, 30 Apr 2020 10:57:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 744B4C016F;
	Thu, 30 Apr 2020 10:57:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17565C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 05DBC88672
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UdXuxR8I4-hH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:57:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 68433883B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588244230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPTO/eyQP/GDrnFIvbjLZMErvY47uLWxT14ZRU2nJfE=;
 b=SVHx/pNp+odZclP14Lp33/CmDu7s1I47FwzFM+KJ9HU2Ab9RkfMh6iAA8SSJLy3uSb87cB
 4llOep17IZC/gR0baje4Lmgq1/d9uL1axfmqRm83gbAYa9qtm1aNaSvGBo2TQb90aSuk8h
 hKUr8ez5uLh2SCCa3enfM6Q7vlamaYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-H3OXSUQEOrqBPQWwCQm_HQ-1; Thu, 30 Apr 2020 06:57:08 -0400
X-MC-Unique: H3OXSUQEOrqBPQWwCQm_HQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8171895A2A;
 Thu, 30 Apr 2020 10:57:06 +0000 (UTC)
Received: from [10.72.13.175] (ovpn-13-175.pek2.redhat.com [10.72.13.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562DD1C950;
 Thu, 30 Apr 2020 10:56:59 +0000 (UTC)
Subject: Re: [RFC/PATCH 0/1] virtio_mmio: hypervisor specific interfaces for
 MMIO
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
 <20200430060653-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <49422625-add9-a13a-6a29-cf761be4cb3a@redhat.com>
Date: Thu, 30 Apr 2020 18:56:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430060653-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, will@kernel.org, linux-kernel@vger.kernel.org,
 pratikp@codeaurora.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8zMCDkuIvljYg2OjA3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBBcHIgMzAsIDIwMjAgYXQgMDM6MzI6NTVQTSArMDUzMCwgU3JpdmF0c2EgVmFkZGFnaXJp
IHdyb3RlOgo+PiBUaGUgVHlwZS0xIGh5cGVydmlzb3Igd2UgYXJlIGRlYWxpbmcgd2l0aCBkb2Vz
IG5vdCBhbGxvdyBmb3IgTU1JTyB0cmFuc3BvcnQuCj4gSG93IGFib3V0IFBDSSB0aGVuPwoKCk9y
IG1heWJlIHlvdSBjYW4gdXNlIHZpcnRpby12ZHBhLgoKVGhhbmtzCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D72B61290D2
	for <lists.virtualization@lfdr.de>; Mon, 23 Dec 2019 03:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5F36C20479;
	Mon, 23 Dec 2019 02:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8M58FTOHXOdN; Mon, 23 Dec 2019 02:06:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DAF9320458;
	Mon, 23 Dec 2019 02:06:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC241C0881;
	Mon, 23 Dec 2019 02:06:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0CD2C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD0A385CE0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id erZ5iOis9kWq
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9C9DD85CC3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Dec 2019 02:06:50 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 21A7A9D47367D63EB243;
 Mon, 23 Dec 2019 10:06:47 +0800 (CST)
Received: from dggeme755-chm.china.huawei.com (10.3.19.101) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Dec 2019 10:06:46 +0800
Received: from [127.0.0.1] (10.173.221.248) by dggeme755-chm.china.huawei.com
 (10.3.19.101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 23
 Dec 2019 10:06:46 +0800
Subject: Re: [PATCH 1/5] KVM: arm64: Document PV-lock interface
To: Markus Elfring <Markus.Elfring@web.de>, <kvm@vger.kernel.org>,
 <kvmarm@lists.cs.columbia.edu>, <linux-arm-kernel@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <virtualization@lists.linux-foundation.org>
References: <20191217135549.3240-2-yezengruan@huawei.com>
 <2337a083-499f-7778-7bf3-9f525a04e17a@web.de>
From: yezengruan <yezengruan@huawei.com>
Message-ID: <6d798e02-7ab2-fc58-9f75-ee74de97ae72@huawei.com>
Date: Mon, 23 Dec 2019 10:06:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2337a083-499f-7778-7bf3-9f525a04e17a@web.de>
Content-Language: en-US
X-Originating-IP: [10.173.221.248]
X-ClientProxiedBy: dggeme703-chm.china.huawei.com (10.1.199.99) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Cc: Mark Rutland <mark.rutland@arm.com>, "Suzuki K.
 Poulose" <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>, Marc
 Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Julien Thierry <julien.thierry.kdev@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

SGkgTWFya3VzLAoKT24gMjAxOS8xMi8yMCAyMjozMiwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4g
4oCmCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXJtL3B2bG9jay5yc3QKPiDigKYK
Pj4gK1BhcmF2aXJ0dWFsaXplZCBsb2NrIHN1cHBvcnQgZm9yIGFybTY0Cj4+ICs9PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiArCj4+ICtLVk0vYXJtNjQgcHJvdmlkcyBz
b21lIOKApgo+IOKApgo+IAo+IEkgc3VnZ2VzdCB0byBhdm9pZCBhIHR5cG8gaGVyZS4KClRoYW5r
cyBmb3IgcG9zdGluZyB0aGlzLgoKPiAKPiBSZWdhcmRzLAo+IE1hcmt1cwo+IAoKVGhhbmtzLAoK
WmVuZ3J1YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
ClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1m
b3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9s
aXN0aW5mby92aXJ0dWFsaXphdGlvbg==

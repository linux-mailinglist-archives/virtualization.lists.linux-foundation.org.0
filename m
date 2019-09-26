Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B1BF2B2
	for <lists.virtualization@lfdr.de>; Thu, 26 Sep 2019 14:15:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE7201215;
	Thu, 26 Sep 2019 12:15:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EB32C1187
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:15:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8EBB0108
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:15:23 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B1138E3C0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:15:23 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id b143so2158892qkg.9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 05:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=WoMvRKtykTYDsX19tL7CCxZ7vdSAP87++ul9jUPZqPM=;
	b=lGmiarrRKIv1JA/DucBzr4+YztrTAJVjBV4eqDIx9N3VpN657C1e3DRO5Ys5tYNYCn
	7MkffN+ldCmD1WkdiUgi1UzYXsNYVGjbuLaAKtd1br/mO3KEPviFrpe5u35lH++KTEe6
	bTqLZMfcM234nidMWAAE0C6G/1iDxn/LjAg25LDFrC+SVSBCEqi/Jc5FTX00i81fSlFT
	H9O8azNTfjiQ/J+H98XQhDTr9uGVS5YaVQvENHz/hwgfGN6qivlapgT8QQkQqXrcfwX6
	IKz4pr3nuk5DaCZrdHuu5AAlYOAfje1Eolcp87SRyTjLRkt6VjgFhQ6qknfZuyKeC0BL
	ND+Q==
X-Gm-Message-State: APjAAAW8RqGCAU1BmrXm9fwbveGPg2M49C41H+glMsOu4kXZZ/Qq321i
	SMMHuuSW/bv3qBO3rbrr7Dqt/Af9W+urpzP4++qecvTPxGXJogm+iTKLP9kVmAAPL9VOlASU+8Z
	ULRl/MbOh08vwdr+gEELkSRvPaOQa/VwlyG/719TheQ==
X-Received: by 2002:ac8:184:: with SMTP id x4mr3591114qtf.249.1569500122288;
	Thu, 26 Sep 2019 05:15:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPTpW78dOXtowZ8lrDddxbCYHPF7M3/HG68ZTdILYDvfvFJG+QYoihU1Xiv24jrNMXunrPAg==
X-Received: by 2002:ac8:184:: with SMTP id x4mr3591073qtf.249.1569500122133;
	Thu, 26 Sep 2019 05:15:22 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	o38sm1025365qtc.39.2019.09.26.05.15.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 05:15:21 -0700 (PDT)
Date: Thu, 26 Sep 2019 08:15:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 6/8] mdev: introduce virtio device and its device ops
Message-ID: <20190926081506-mutt-send-email-mst@kernel.org>
References: <20190924135332.14160-1-jasowang@redhat.com>
	<20190924135332.14160-7-jasowang@redhat.com>
	<AADFC41AFE54684AB9EE6CBC0274A5D19D58F7DA@SHSMSX104.ccr.corp.intel.com>
	<2210d23d-38e4-e654-e53d-7867348de86a@redhat.com>
	<20190925092044-mutt-send-email-mst@kernel.org>
	<eb7c76b5-2938-2e73-d847-b174a289c5c9@redhat.com>
	<20190926042102-mutt-send-email-mst@kernel.org>
	<d6a66de5-5774-5ad6-8e9d-26bb6d8eaa8c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6a66de5-5774-5ad6-8e9d-26bb6d8eaa8c@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "christophe.de.dinechin@gmail.com" <christophe.de.dinechin@gmail.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"airlied@linux.ie" <airlied@linux.ie>,
	"joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
	"heiko.carstens@de.ibm.com" <heiko.carstens@de.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"kwankhede@nvidia.com" <kwankhede@nvidia.com>,
	"rob.miller@broadcom.com" <rob.miller@broadcom.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sebott@linux.ibm.com" <sebott@linux.ibm.com>,
	"lulu@redhat.com" <lulu@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	"borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
	"haotian.wang@sifive.com" <haotian.wang@sifive.com>, "Wang,
	Zhi A" <zhi.a.wang@intel.com>, "idos@mellanox.com" <idos@mellanox.com>,
	"gor@linux.ibm.com" <gor@linux.ibm.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
	"Wang, Xiao W" <xiao.w.wang@intel.com>,
	"freude@linux.ibm.com" <freude@linux.ibm.com>,
	"zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
	"parav@mellanox.com" <parav@mellanox.com>, "Wang,
	Zhihong" <zhihong.wang@intel.com>, "Vivi,
	Rodrigo" <rodrigo.vivi@intel.com>, "intel-gvt-dev@lists.freedesktop.org"
	<intel-gvt-dev@lists.freedesktop.org>,
	"akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
	"oberpar@linux.ibm.com" <oberpar@linux.ibm.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "Zhu,
	Lingshan" <lingshan.zhu@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMDY6NDg6NTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMjYg5LiL5Y2INDoyMSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6MDQ6NDZQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gPiA+ID4gSSdtIG5vdCBzdXJlIGhvdyBzdGFibGUgYWJvdmUgb3BzIGFy
ZS4KPiA+ID4gPiA+IEl0J3MgdGhlIGtlcm5lbCBpbnRlcm5hbCBBUEksIHNvIHRoZXJlJ3Mgbm8g
c3RyaWN0IHJlcXVpcmVtZW50IGZvciB0aGlzLiBXZQo+ID4gPiA+ID4gd2lsbCBleHBvcnQgYSB2
ZXJzaW9uIHZhbHVlIGZvciB1c2Vyc3BhY2UgZm9yIGNvbXBhdGliaWxpdHkuCj4gPiA+ID4gR2l2
ZW4gaXQncyB0aWVkIHRvIHZpcnRpbyB3ZSBwcm9iYWJseSB3YW50IGtlcm5lbCt1c2Vyc3BhY2UK
PiA+ID4gPiBmZWF0dXJlIGJpdHM/Cj4gPiA+IAo+ID4gPiBZZXMsIHRoZW4gSSB0aGluayB3ZSBj
b3VsZCBwcm9iYWJseSBoYXZlIGEgdmVyc2lvbiBmaWVsZCBpbnNpZGUgZS5nCj4gPiA+IGRldmlj
ZV9vcHMgc3RydWN0dXJlLiBUaGVuIGl0IGNvdWxkIGJlIGZldGNoZWQgZnJvbSBib3RoIGtlcm5l
bCBhbmQKPiA+ID4gdXNlcnNwYWNlIGRyaXZlci4KPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gPiAK
PiA+IAo+ID4gbXkgcG9pbnQgd2FzIGZlYXR1cmUgYml0cyBub3QgYSB2ZXJzaW9uIG51bWJlci4K
PiAKPiAKPiBTb21ldGhpbmcgbGlrZSBiYWNrZW5kX2ZlYXR1cmUgdGhhdCBjdXJyZW50IHZob3N0
X25ldCBkaWQ/Cj4gCj4gVGhhbmtzCj4gCj4gCj4gPiAKCnJpZ2h0Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==

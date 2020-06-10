Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E858B1F5155
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 11:43:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 91B78880D0;
	Wed, 10 Jun 2020 09:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J+z-DoAld+c0; Wed, 10 Jun 2020 09:43:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F52A880B3;
	Wed, 10 Jun 2020 09:43:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72681C088C;
	Wed, 10 Jun 2020 09:43:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E019AC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CEB958715A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xja9Ank51EqQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:43:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F306D8714A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591782226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wMM5YSAnxtME2rVDR52gs/CCU183tmqWa7IkhS0ZU6A=;
 b=Nkz2zbhJFwzpNQFQN5RDy4rhatIhe1y7ateQ+nc8M0FWDulJqgwCzoIcHkn+XvRFUjU2ae
 Sx8Gvm8dXf/ZOLFwtrMnOJ7U6BGvGqTIpZchW3cV2QoJMmFY2KCJ6wok/0mm9/jnupXM/Q
 ajCVK+WkxW8/Hw5vFaonhF6rLRob5i0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-UyPYK_sNO8SfChXSRlgK8A-1; Wed, 10 Jun 2020 05:43:45 -0400
X-MC-Unique: UyPYK_sNO8SfChXSRlgK8A-1
Received: by mail-wr1-f69.google.com with SMTP id s7so838760wrm.16
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 02:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=cqenDkPII+w3N9PhboDRPWmnWtl237duUuxheBtHmo8=;
 b=gN+t2/1q1xhTNtb3eBqR2cGmF81r2q/HccfP/EMXxkHkKz8Muwog8ylT5BBoweltHf
 BahuNpT6JHHKrOQy4IK87ERjnjuq1hU8s6E3QToLGTg2Rq4tzKbO2q1V6EckHNXZgtcd
 0wq94ZaRWSF4y2my5/zbxKeZsMShJ1NSYg3tYU3tZEqPUueh6FwZUREFpdUBZYiHDtVo
 N9yfQ2Dlvkx6BdkeppYsnzZT5PE+eirS6leWo7oSK3TBLxc/Y2ANAyzMHzglroA9UVdO
 xXjZbGkU31eDrG2CatOJ5yvO3ywXNCe8WFaDEt9kW0JUiDie1iDr502sQez1a1FXbkyb
 saQA==
X-Gm-Message-State: AOAM533HJpC5SKc2JZpb9Key3hsNvjS+UXHxDepT4me5FXvj6tinMvvc
 mjrj4RE2u6+QQHdsD8yffkBKdxe4BuL+n7bKWTY5KrktGA5760a6aOqZf8DQ3f9yHkSd7NlWVoc
 0TvTOxW+mNT0tG6inMkO9OQhcwLqThOtHpoui30yCtA==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr2948662wro.60.1591782224277;
 Wed, 10 Jun 2020 02:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVmcr+jf7/ZMdNhZWn5hNRs0ZgnnoTFCWKF9letJebZyLdzd6sY5umcaFiaoilisOKVzp02w==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr2948642wro.60.1591782224092;
 Wed, 10 Jun 2020 02:43:44 -0700 (PDT)
Received: from [192.168.3.122] (p4ff23dec.dip0.t-ipconnect.de. [79.242.61.236])
 by smtp.gmail.com with ESMTPSA id r5sm7527242wrq.0.2020.06.10.02.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 02:43:42 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] virtio-mem: silence a static checker warning
Date: Wed, 10 Jun 2020 11:43:42 +0200
Message-Id: <56B2561B-33AC-40AB-9991-97EC72F9613F@redhat.com>
References: <20200610085911.GC5439@mwanda>
In-Reply-To: <20200610085911.GC5439@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: iPhone Mail (17E262)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Cgo+IEFtIDEwLjA2LjIwMjAgdW0gMTA6NTkgc2NocmllYiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+Ogo+IAo+IO+7v1NtYXRjaCBjb21wbGFpbnMgdGhhdCAicmMiIGNh
biBiZSB1bmluaXRpYWxpemVkIGlmIHdlIGhpdCB0aGUgImJyZWFrOyIKPiBzdGF0ZW1lbnQgb24g
dGhlIGZpcnN0IGl0ZXJhdGlvbiB0aHJvdWdoIHRoZSBsb29wLiAgSSBzdXNwZWN0IHRoYXQgdGhp
cwo+IGNhbid0IGhhcHBlbiBpbiByZWFsIGxpZmUsIGJ1dCByZXR1cm5pbmcgYSB6ZXJvIGxpdGVy
YWwgaXMgY2xlYW5lciBhbmQKPiBzaWxlbmNlIHRoZSBzdGF0aWMgY2hlY2tlciB3YXJuaW5nLgo+
IAoKUmlnaHQsIGl04oCYcyBpbXBvc3NpYmxlIGluIHJlYWwgbGlmZS4gVGhhbmtzIQoKQWNrZWQt
Ynk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgoKPiBTaWduZWQtb2ZmLWJ5
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gZHJpdmVy
cy92aXJ0aW8vdmlydGlvX21lbS5jIHwgMiArLQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92aXJ0
aW9fbWVtLmMgYi9kcml2ZXJzL3ZpcnRpby92aXJ0aW9fbWVtLmMKPiBpbmRleCBmNjU4ZmU5MTQ5
YmViLi44OTNlZjE4MDYwYTAyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19t
ZW0uYwo+ICsrKyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tZW0uYwo+IEBAIC0xMTkyLDcgKzEx
OTIsNyBAQCBzdGF0aWMgaW50IHZpcnRpb19tZW1fbWJfcGx1Z19hbnlfc2Ioc3RydWN0IHZpcnRp
b19tZW0gKnZtLCB1bnNpZ25lZCBsb25nIG1iX2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
VklSVElPX01FTV9NQl9TVEFURV9PRkZMSU5FKTsKPiAgICB9Cj4gCj4gLSAgICByZXR1cm4gcmM7
Cj4gKyAgICByZXR1cm4gMDsKPiB9Cj4gCj4gLyoKPiAtLSAKPiAyLjI2LjIKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==

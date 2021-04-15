Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E45AE36008C
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 05:36:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73CC3402F0;
	Thu, 15 Apr 2021 03:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zyXAt-MXX9Ko; Thu, 15 Apr 2021 03:36:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0C234063C;
	Thu, 15 Apr 2021 03:36:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E82BC000A;
	Thu, 15 Apr 2021 03:36:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED5F5C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 03:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCC1C84692
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 03:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGkIZBXrrvZQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 03:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B46D784693
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 03:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618457798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=czJHMaI3E97Ji0Ap43HwtLZnd4lX6ZvCcTZR3x3oep8=;
 b=dFTGNs7w+171BiO7uPN+OgWhdWjFnMrHa1psX1DmzusM6GI4ang7AbLbZJHaavWWj1yay9
 q9okA5CQSOS/LUIOLKvZzoT7mmCdLR3pbr2k8t5TJfTKSQ/Byjyfhnkl87AxjR+OPJjKA5
 1Q8sh5mWeVN9u45oX4jjYWXvEo4rMS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-xKvgv2EXP12NRNw8PZi2Hg-1; Wed, 14 Apr 2021 23:36:37 -0400
X-MC-Unique: xKvgv2EXP12NRNw8PZi2Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FD38189C8;
 Thu, 15 Apr 2021 03:36:35 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-220.pek2.redhat.com
 [10.72.13.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3CDC5D9DC;
 Thu, 15 Apr 2021 03:36:29 +0000 (UTC)
Subject: Re: [PATCH 3/3] vDPA/ifcvf: get_config_size should return dev
 specific config size
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com,
 leonro@nvidia.com
References: <20210414091832.5132-1-lingshan.zhu@intel.com>
 <20210414091832.5132-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cc72edee-cbc1-89e6-f901-3f044f738693@redhat.com>
Date: Thu, 15 Apr 2021 11:36:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414091832.5132-4-lingshan.zhu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC8xNCDPws7nNToxOCwgWmh1IExpbmdzaGFuINC0tcA6Cj4gZ2V0X2NvbmZpZ19z
aXplKCkgc2hvdWxkIHJldHVybiB0aGUgc2l6ZSBiYXNlZCBvbiB0aGUgZGVjZWN0ZWQKPiBkZXZp
Y2UgdHlwZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGlu
dGVsLmNvbT4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCgo+
IC0tLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyB8IDExICsrKysrKysrKyst
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgYi9kcml2ZXJzL3Zk
cGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gaW5kZXggOWI2YTM4Yjc5OGZhLi5iNDhiOTc4OWI2OWUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+ICsrKyBiL2Ry
aXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBAQCAtMzQ3LDcgKzM0NywxNiBAQCBzdGF0
aWMgdTMyIGlmY3ZmX3ZkcGFfZ2V0X3ZxX2FsaWduKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9k
ZXYpCj4gICAKPiAgIHN0YXRpYyBzaXplX3QgaWZjdmZfdmRwYV9nZXRfY29uZmlnX3NpemUoc3Ry
dWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldikKPiAgIHsKPiAtCXJldHVybiBzaXplb2Yoc3RydWN0
IHZpcnRpb19uZXRfY29uZmlnKTsKPiArCXN0cnVjdCBpZmN2Zl9odyAqdmYgPSB2ZHBhX3RvX3Zm
KHZkcGFfZGV2KTsKPiArCXNpemVfdCBzaXplOwo+ICsKPiArCWlmICh2Zi0+ZGV2X3R5cGUgPT0g
VklSVElPX0lEX05FVCkKPiArCQlzaXplID0gc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZp
Zyk7Cj4gKwo+ICsJaWYgKHZmLT5kZXZfdHlwZSA9PSBWSVJUSU9fSURfQkxPQ0spCj4gKwkJc2l6
ZSA9IHNpemVvZihzdHJ1Y3QgdmlydGlvX2Jsa19jb25maWcpOwo+ICsKPiArCXJldHVybiBzaXpl
Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCBpZmN2Zl92ZHBhX2dldF9jb25maWcoc3RydWN0
IHZkcGFfZGV2aWNlICp2ZHBhX2RldiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==

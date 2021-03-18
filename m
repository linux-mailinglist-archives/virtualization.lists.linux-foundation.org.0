Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA1F33FDBC
	for <lists.virtualization@lfdr.de>; Thu, 18 Mar 2021 04:22:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA28D41566;
	Thu, 18 Mar 2021 03:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mKdfkKZfQKB1; Thu, 18 Mar 2021 03:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8E3B43092;
	Thu, 18 Mar 2021 03:22:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67080C0001;
	Thu, 18 Mar 2021 03:22:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08BC5C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 03:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC7F84150
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 03:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljjCPK1EoscJ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 03:22:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E15C840C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 03:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616037771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAdQb1xWq5W0KP92TFMDYP8cv7SphLZ0dz63LpVNMdg=;
 b=J1DD+LKTb8MwF9B47EFX5hJwzP4LWLRJv7jMTl/fv3ngdz7g86hKJ74FAHurRdOBbnbgW/
 Z1cEeoH4NCkB340fso9JqJ0C1aNNNG+B7KMODUzNhtDWfEu9XVpFt18VGwe/Q5SQxxb1Yf
 zYJms9nuxk7mjxfnw9Bj5TuscDcmoiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-lvKCQcO5NiKXKEvGPTtdLA-1; Wed, 17 Mar 2021 23:22:48 -0400
X-MC-Unique: lvKCQcO5NiKXKEvGPTtdLA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06BB8189D3;
 Thu, 18 Mar 2021 03:22:44 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-131.pek2.redhat.com
 [10.72.13.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 214261007625;
 Thu, 18 Mar 2021 03:22:23 +0000 (UTC)
Subject: Re: [PATCH v4 09/14] vhost/vdpa: use get_config_size callback in
 vhost_vdpa_config_validate()
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20210315163450.254396-1-sgarzare@redhat.com>
 <20210315163450.254396-10-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <32d55226-445e-4de5-2f5e-327bc724f0c4@redhat.com>
Date: Thu, 18 Mar 2021 11:22:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315163450.254396-10-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Stefan Hajnoczi <stefanha@redhat.com>
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

CtTaIDIwMjEvMy8xNiDJz87nMTI6MzQsIFN0ZWZhbm8gR2FyemFyZWxsYSDQtLXAOgo+IExldCdz
IHVzZSB0aGUgbmV3ICdnZXRfY29uZmlnX3NpemUoKScgY2FsbGJhY2sgYXZhaWxhYmxlIGluc3Rl
YWQgb2YKPiB1c2luZyB0aGUgJ3ZpcnRpb19pZCcgdG8gZ2V0IHRoZSBzaXplIG9mIHRoZSBkZXZp
Y2UgY29uZmlnIHNwYWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhIDxz
Z2FyemFyZUByZWRoYXQuY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRo
YXQuY29tPgoKCj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L3ZkcGEuYyB8IDkgKystLS0tLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBp
bmRleCBlMGEyN2UzMzYyOTMuLjdhZTQwODBlNTdkOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zo
b3N0L3ZkcGEuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gQEAgLTE4OCwxMyArMTg4
LDggQEAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV9zZXRfc3RhdHVzKHN0cnVjdCB2aG9zdF92ZHBh
ICp2LCB1OCBfX3VzZXIgKnN0YXR1c3ApCj4gICBzdGF0aWMgaW50IHZob3N0X3ZkcGFfY29uZmln
X3ZhbGlkYXRlKHN0cnVjdCB2aG9zdF92ZHBhICp2LAo+ICAgCQkJCSAgICAgIHN0cnVjdCB2aG9z
dF92ZHBhX2NvbmZpZyAqYykKPiAgIHsKPiAtCWxvbmcgc2l6ZSA9IDA7Cj4gLQo+IC0Jc3dpdGNo
ICh2LT52aXJ0aW9faWQpIHsKPiAtCWNhc2UgVklSVElPX0lEX05FVDoKPiAtCQlzaXplID0gc2l6
ZW9mKHN0cnVjdCB2aXJ0aW9fbmV0X2NvbmZpZyk7Cj4gLQkJYnJlYWs7Cj4gLQl9Cj4gKwlzdHJ1
Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+ICsJbG9uZyBzaXplID0gdmRwYS0+Y29u
ZmlnLT5nZXRfY29uZmlnX3NpemUodmRwYSk7Cj4gICAKPiAgIAlpZiAoYy0+bGVuID09IDApCj4g
ICAJCXJldHVybiAtRUlOVkFMOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u

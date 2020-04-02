Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4A19C54C
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 17:01:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B99D888B74;
	Thu,  2 Apr 2020 15:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t4OawJgOj6uB; Thu,  2 Apr 2020 15:01:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BF0288B6B;
	Thu,  2 Apr 2020 15:01:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22888C07FF;
	Thu,  2 Apr 2020 15:01:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D678C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 997428727C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U93RAcm7Csyi
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:01:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2057087267
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585839685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIwTqVDSsfeWrRYzgLqwVlDvPStiUAQNxmE1Ql/H/f0=;
 b=Bws3e1BJrDH7bZYYLThXkxSbUFuy5AI9LUlL4B9q1+gqNYiXfVw3dfR1x87fYmSX2OJQsD
 ypCdwzZT2X2wxZ+FEBg3DJYcMlq26vYZ+qgRd38ZhJRW4XE6YAU5N8I4EPjvIpvqcQ2e0O
 kx+ZNSkzpg33f+DeocgxNwo/woM6yUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-LfDGN9UIPmO-AL2Wbi6mkA-1; Thu, 02 Apr 2020 11:01:24 -0400
X-MC-Unique: LfDGN9UIPmO-AL2Wbi6mkA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B342107B271;
 Thu,  2 Apr 2020 15:01:23 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F5385C1B0;
 Thu,  2 Apr 2020 15:01:15 +0000 (UTC)
Subject: Re: [PATCH v2] vhost: drop vring dependency on iotlb
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200402144519.34194-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <44f9b9d3-3da2-fafe-aa45-edd574dc6484@redhat.com>
Date: Thu, 2 Apr 2020 23:01:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402144519.34194-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8yIOS4i+WNiDEwOjQ2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gdnJp
bmdoIGNhbiBub3cgYmUgYnVpbHQgd2l0aG91dCBJT1RMQi4KPiBTZWxlY3QgSU9UTEIgZGlyZWN0
bHkgd2hlcmUgaXQncyB1c2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPgo+IEFwcGxpZXMgb24gdG9wIG9mIG15IHZob3N0IHRy
ZWUuCj4gQ2hhbmdlcyBmcm9tIHYxOgo+IAlWRFBBX1NJTSBuZWVkcyBWSE9TVF9JT1RMQgoKCkl0
IGxvb2tzIHRvIG1lIHRoZSBwYXRjaCBpcyBpZGVudGljYWwgdG8gdjEuCgpUaGFua3MKCgo+Cj4g
ICBkcml2ZXJzL3ZkcGEvS2NvbmZpZyAgfCAxICsKPiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyB8
IDEgLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9LY29uZmlnIGIvZHJpdmVycy92ZHBhL0tjb25m
aWcKPiBpbmRleCA3ZGIxNDYwMTA0YjcuLjA4YjYxNWYyZGEzOSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZkcGEvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9LY29uZmlnCj4gQEAgLTE3LDYg
KzE3LDcgQEAgY29uZmlnIFZEUEFfU0lNCj4gICAJZGVwZW5kcyBvbiBSVU5USU1FX1RFU1RJTkdf
TUVOVQo+ICAgCXNlbGVjdCBWRFBBCj4gICAJc2VsZWN0IFZIT1NUX1JJTkcKPiArCXNlbGVjdCBW
SE9TVF9JT1RMQgo+ICAgCWRlZmF1bHQgbgo+ICAgCWhlbHAKPiAgIAkgIHZEUEEgbmV0d29ya2lu
ZyBkZXZpY2Ugc2ltdWxhdG9yIHdoaWNoIGxvb3AgVFggdHJhZmZpYyBiYWNrCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IGluZGV4
IGYwNDA0Y2UyNTVkMS4uY2I2YjE3MzIzZWIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3Qv
S2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IEBAIC04LDcgKzgsNiBAQCBj
b25maWcgVkhPU1RfSU9UTEIKPiAgIAo+ICAgY29uZmlnIFZIT1NUX1JJTkcKPiAgIAl0cmlzdGF0
ZQo+IC0Jc2VsZWN0IFZIT1NUX0lPVExCCj4gICAJaGVscAo+ICAgCSAgVGhpcyBvcHRpb24gaXMg
c2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBuZWVkcyB0byBhY2Nlc3MKPiAgIAkgIHRoZSBo
b3N0IHNpZGUgb2YgYSB2aXJ0aW8gcmluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==

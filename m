Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45A19C412
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:28:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0B17285C2E;
	Thu,  2 Apr 2020 14:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qvp31TSJhiwr; Thu,  2 Apr 2020 14:28:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 693FF85142;
	Thu,  2 Apr 2020 14:28:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FC4EC1D89;
	Thu,  2 Apr 2020 14:28:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CBFCC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 04F7688A3D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8C7x5gmmMEI
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:28:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0165788A18
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585837724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6/Zdn4PdxHJ91S/7dMf7deMcEC4jxiYXpkPo4ursOU=;
 b=az2hfEOT1gaR7Cyb+qVzmLfq3r47CaxZo/Xigd9H8D7ra7q+ScDz8F2VUNfKRob+MatdER
 CEGSrRzkGPOSEEkPuJ7VlfLWqqYoqZ+FijqNAVRNgSW0MYtOHFIOfWpB7a1i+t6+h6Ig/u
 76y9LYtUOj0v3WUH/PK6MLj48XgOPIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-enE41F3_PCCPc9ZZekUOcg-1; Thu, 02 Apr 2020 10:28:42 -0400
X-MC-Unique: enE41F3_PCCPc9ZZekUOcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FF0118C43F9;
 Thu,  2 Apr 2020 14:28:32 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 668BD26172;
 Thu,  2 Apr 2020 14:28:30 +0000 (UTC)
Subject: Re: [PATCH] vhost: drop vring dependency on iotlb
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200402141207.32628-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <afe230b9-708f-02a1-c3af-51e9d4fdd212@redhat.com>
Date: Thu, 2 Apr 2020 22:28:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402141207.32628-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvNC8yIOS4i+WNiDEwOjEyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gdnJp
bmdoIGNhbiBub3cgYmUgYnVpbHQgd2l0aG91dCBJT1RMQi4KPiBTZWxlY3QgSU9UTEIgZGlyZWN0
bHkgd2hlcmUgaXQncyB1c2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPgo+IFRoaXMgaXMgb24gdG9wIG9mIG15IHByZXZpb3Vz
IHBhdGNoIChpbiB2aG9zdCB0cmVlIG5vdykuCj4KPiAgIGRyaXZlcnMvdmRwYS9LY29uZmlnICB8
IDEgKwo+ICAgZHJpdmVycy92aG9zdC9LY29uZmlnIHwgMSAtCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
ZHBhL0tjb25maWcgYi9kcml2ZXJzL3ZkcGEvS2NvbmZpZwo+IGluZGV4IDdkYjE0NjAxMDRiNy4u
MDhiNjE1ZjJkYTM5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9LY29uZmlnCj4gKysrIGIv
ZHJpdmVycy92ZHBhL0tjb25maWcKPiBAQCAtMTcsNiArMTcsNyBAQCBjb25maWcgVkRQQV9TSU0K
PiAgIAlkZXBlbmRzIG9uIFJVTlRJTUVfVEVTVElOR19NRU5VCj4gICAJc2VsZWN0IFZEUEEKPiAg
IAlzZWxlY3QgVkhPU1RfUklORwo+ICsJc2VsZWN0IFZIT1NUX0lPVExCCj4gICAJZGVmYXVsdCBu
Cj4gICAJaGVscAo+ICAgCSAgdkRQQSBuZXR3b3JraW5nIGRldmljZSBzaW11bGF0b3Igd2hpY2gg
bG9vcCBUWCB0cmFmZmljIGJhY2sKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9LY29uZmln
IGIvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gaW5kZXggMjFmZWVhMGQ2OWM5Li5iZGQyNzBmZWRl
MjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9zdC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy92
aG9zdC9LY29uZmlnCj4gQEAgLTYsNyArNiw2IEBAIGNvbmZpZyBWSE9TVF9JT1RMQgo+ICAgCj4g
ICBjb25maWcgVkhPU1RfUklORwo+ICAgCXRyaXN0YXRlCj4gLQlzZWxlY3QgVkhPU1RfSU9UTEIK
PiAgIAloZWxwCj4gICAJICBUaGlzIG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdo
aWNoIG5lZWRzIHRvIGFjY2Vzcwo+ICAgCSAgdGhlIGhvc3Qgc2lkZSBvZiBhIHZpcnRpbyByaW5n
LgoKCkRvIHdlIG5lZWQgdG8gbWVudGlvbiBkcml2ZXIgbmVlZCB0byBzZWxlY3QgVkhPU1RfSU9U
TEIgYnkgaXRzZWxmIGhlcmU/CgpUaGFua3MKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u

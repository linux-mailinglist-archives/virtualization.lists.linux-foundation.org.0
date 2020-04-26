Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E331B8B9F
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 05:25:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D2E28586A;
	Sun, 26 Apr 2020 03:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbbouQmYqHWG; Sun, 26 Apr 2020 03:25:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A422385886;
	Sun, 26 Apr 2020 03:25:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D13FC0175;
	Sun, 26 Apr 2020 03:25:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C363CC0175
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ADB8D86651
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOXjY+OslzcZ
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:25:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D41A2865D0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587871546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xeVCSVVAGo0Z4+nT2s2gLtAX66uKIDuBw9cn9Gzx2mE=;
 b=Ks7qKABL7+eZd5yuCyv64OjG5A4WxTUbZVVQUwEL13SYjCaB49SiyFkuyThg7NRelp5sH8
 hElcj4udkuYUwrNddaCdrwNANVOg0qKaimibzeXdL5bzafacRIgUVyd6pi/BI5TXNldXSe
 jP56qAJMtTkNtkyf3ptyixOZ3Zax2po=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-hFEJfXROPcGf0r9lcBgsYA-1; Sat, 25 Apr 2020 23:25:42 -0400
X-MC-Unique: hFEJfXROPcGf0r9lcBgsYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71F6E1800D4A;
 Sun, 26 Apr 2020 03:25:41 +0000 (UTC)
Received: from [10.72.13.103] (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBEA25C1C3;
 Sun, 26 Apr 2020 03:25:35 +0000 (UTC)
Subject: Re: [PATCH 2/2] vdpa: implement config interrupt in IFCVF
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587722659-1300-1-git-send-email-lingshan.zhu@intel.com>
 <1587722659-1300-3-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bb909a20-3f14-427d-ee40-129a1844486b@redhat.com>
Date: Sun, 26 Apr 2020 11:25:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587722659-1300-3-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNC8yNCDkuIvljYg2OjA0LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW1wbGVtZW50cyBjb25maWcgaW50ZXJydXB0IHN1cHBvcnQKPiBpbiBJRkMgVkYKPgo+IFNp
Z25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVsLmNvbT4KPiAtLS0K
PiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMgfCAgMyArKysKPiAgIGRyaXZlcnMv
dmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggfCAgMiArKwo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lm
Y3ZmX21haW4uYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKy0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFz
ZS5jCj4gaW5kZXggYjYxYjA2ZS4uYzgyNWQ5OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEv
aWZjdmYvaWZjdmZfYmFzZS5jCj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2Uu
Ywo+IEBAIC0xODUsNiArMTg1LDkgQEAgdm9pZCBpZmN2Zl9zZXRfc3RhdHVzKHN0cnVjdCBpZmN2
Zl9odyAqaHcsIHU4IHN0YXR1cykKPiAgIAo+ICAgdm9pZCBpZmN2Zl9yZXNldChzdHJ1Y3QgaWZj
dmZfaHcgKmh3KQo+ICAgewo+ICsJaHctPmNvbmZpZ19jYi5jYWxsYmFjayA9IE5VTEw7Cj4gKwlo
dy0+Y29uZmlnX2NiLnByaXZhdGUgPSBOVUxMOwo+ICsKPiAgIAlpZmN2Zl9zZXRfc3RhdHVzKGh3
LCAwKTsKPiAgIAkvKiBmbHVzaCBzZXRfc3RhdHVzLCBtYWtlIHN1cmUgVkYgaXMgc3RvcHBlZCwg
cmVzZXQgKi8KPiAgIAlpZmN2Zl9nZXRfc3RhdHVzKGh3KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaCBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNl
LmgKPiBpbmRleCBlODAzMDcwLi43NjkyOGIwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9p
ZmN2Zi9pZmN2Zl9iYXNlLmgKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5o
Cj4gQEAgLTgxLDYgKzgxLDggQEAgc3RydWN0IGlmY3ZmX2h3IHsKPiAgIAl2b2lkIF9faW9tZW0g
Km5ldF9jZmc7Cj4gICAJc3RydWN0IHZyaW5nX2luZm8gdnJpbmdbSUZDVkZfTUFYX1FVRVVFX1BB
SVJTICogMl07Cj4gICAJdm9pZCBfX2lvbWVtICogY29uc3QgKmJhc2U7Cj4gKwljaGFyIGNvbmZp
Z19tc2l4X25hbWVbMjU2XTsKPiArCXN0cnVjdCB2ZHBhX2NhbGxiYWNrIGNvbmZpZ19jYjsKPiAg
IH07Cj4gICAKPiAgIHN0cnVjdCBpZmN2Zl9hZGFwdGVyIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWlu
LmMKPiBpbmRleCA4ZDU0ZGM1Li5mN2JhZWNhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9p
ZmN2Zi9pZmN2Zl9tYWluLmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5j
Cj4gQEAgLTE4LDYgKzE4LDE2IEBACj4gICAjZGVmaW5lIERSSVZFUl9BVVRIT1IgICAiSW50ZWwg
Q29ycG9yYXRpb24iCj4gICAjZGVmaW5lIElGQ1ZGX0RSSVZFUl9OQU1FICAgICAgICJpZmN2ZiIK
PiAgIAo+ICtzdGF0aWMgaXJxcmV0dXJuX3QgaWZjdmZfY29uZmlnX2NoYW5nZWQoaW50IGlycSwg
dm9pZCAqYXJnKQo+ICt7Cj4gKwlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gYXJnOwo+ICsKPiArCWlm
ICh2Zi0+Y29uZmlnX2NiLmNhbGxiYWNrKQo+ICsJCXJldHVybiB2Zi0+Y29uZmlnX2NiLmNhbGxi
YWNrKHZmLT5jb25maWdfY2IucHJpdmF0ZSk7Cj4gKwo+ICsJcmV0dXJuIElSUV9IQU5ETEVEOwoK
ClNvIGl0IGxvb2tzIHRvIG1lIHRoZSBjdXJyZW50IHN1cHBvcnQgb2YgVklSVElPX05FVF9GX1NU
QVRVUyBpcyBicm9rZW4gCndpdGhvdXQgdGhpcyBwYXRjaC4KCldlIHByb2JhYmx5IG5lZWQgdG8g
cGF0Y2ggdG8gZGlzYWJsZSBpdC4KClRoYW5rcwoKCj4gK30KPiArCj4gICBzdGF0aWMgaXJxcmV0
dXJuX3QgaWZjdmZfaW50cl9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmFyZykKPiAgIHsKPiAgIAlz
dHJ1Y3QgdnJpbmdfaW5mbyAqdnJpbmcgPSBhcmc7Cj4gQEAgLTI1Niw3ICsyNjYsMTAgQEAgc3Rh
dGljIHZvaWQgaWZjdmZfdmRwYV9zZXRfY29uZmlnKHN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYV9k
ZXYsCj4gICBzdGF0aWMgdm9pZCBpZmN2Zl92ZHBhX3NldF9jb25maWdfY2Ioc3RydWN0IHZkcGFf
ZGV2aWNlICp2ZHBhX2RldiwKPiAgIAkJCQkgICAgIHN0cnVjdCB2ZHBhX2NhbGxiYWNrICpjYikK
PiAgIHsKPiAtCS8qIFdlIGRvbid0IHN1cHBvcnQgY29uZmlnIGludGVycnVwdCAqLwo+ICsJc3Ry
dWN0IGlmY3ZmX2h3ICp2ZiA9IHZkcGFfdG9fdmYodmRwYV9kZXYpOwo+ICsKPiArCXZmLT5jb25m
aWdfY2IuY2FsbGJhY2sgPSBjYi0+Y2FsbGJhY2s7Cj4gKwl2Zi0+Y29uZmlnX2NiLnByaXZhdGUg
PSBjYi0+cHJpdmF0ZTsKPiAgIH0KPiAgIAo+ICAgLyoKPiBAQCAtMjkyLDYgKzMwNSwxMyBAQCBz
dGF0aWMgaW50IGlmY3ZmX3JlcXVlc3RfaXJxKHN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVy
KQo+ICAgCXN0cnVjdCBpZmN2Zl9odyAqdmYgPSAmYWRhcHRlci0+dmY7Cj4gICAJaW50IHZlY3Rv
ciwgaSwgcmV0LCBpcnE7Cj4gICAKPiArCXNucHJpbnRmKHZmLT5jb25maWdfbXNpeF9uYW1lLCAy
NTYsICJpZmN2Zlslc10tY29uZmlnXG4iLAo+ICsJCXBjaV9uYW1lKHBkZXYpKTsKPiArCXZlY3Rv
ciA9IDA7Cj4gKwlpcnEgPSBwY2lfaXJxX3ZlY3RvcihwZGV2LCB2ZWN0b3IpOwo+ICsJcmV0ID0g
ZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsCj4gKwkJCSAgICAgICBpZmN2Zl9jb25m
aWdfY2hhbmdlZCwgMCwKPiArCQkJICAgICAgIHZmLT5jb25maWdfbXNpeF9uYW1lLCB2Zik7Cj4g
ICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgSUZDVkZfTUFYX1FVRVVFX1BBSVJTICogMjsgaSsrKSB7
Cj4gICAJCXNucHJpbnRmKHZmLT52cmluZ1tpXS5tc2l4X25hbWUsIDI1NiwgImlmY3ZmWyVzXS0l
ZFxuIiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==

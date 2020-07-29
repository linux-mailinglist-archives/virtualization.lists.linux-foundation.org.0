Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890E231C03
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 11:22:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 420BF85D9B;
	Wed, 29 Jul 2020 09:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lapRb0JVLZYA; Wed, 29 Jul 2020 09:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3D5285D97;
	Wed, 29 Jul 2020 09:22:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92CDDC004D;
	Wed, 29 Jul 2020 09:22:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D66E1C004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B550685D4C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OArlxUlbeJHf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9776C857BE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596014534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfMmbbC8VgRw8IQ9ZtQih9sQCoQJENghyVj/1NXZj5U=;
 b=T9UoEIknSwUDf/2kxu5WvCZ3rTITlwy98ZFg9AFeQqJgkGyfmjq6EBz66jTLtqNt2xlCZk
 JctLLKTcgRtKptch61SSOElbupeK21LG6oWq+5pew8rRFqYFgqqTOPSkfTEF7u5/Wxa7ri
 ZnDeYSN6U9zAj8wq0QDpKJETv6Gayjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-JsuazCKzOVC8QSBFb1PA1Q-1; Wed, 29 Jul 2020 05:22:10 -0400
X-MC-Unique: JsuazCKzOVC8QSBFb1PA1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D662C1800D4A;
 Wed, 29 Jul 2020 09:22:08 +0000 (UTC)
Received: from [10.72.13.120] (ovpn-13-120.pek2.redhat.com [10.72.13.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86C7179310;
 Wed, 29 Jul 2020 09:21:55 +0000 (UTC)
Subject: Re: [PATCH V4 4/6] vhost_vdpa: implement IRQ offloading in vhost_vdpa
To: Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20200728042405.17579-1-lingshan.zhu@intel.com>
 <20200728042405.17579-5-lingshan.zhu@intel.com>
 <20200728090438.GA21875@nps-server-21.mtl.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c87d4a5a-3106-caf2-2bc1-764677218967@redhat.com>
Date: Wed, 29 Jul 2020 17:21:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728090438.GA21875@nps-server-21.mtl.labs.mlnx>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: shahafs@mellanox.com, wanpengli@tencent.com, parav@mellanox.com,
 kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 sean.j.christopherson@intel.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com
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

Ck9uIDIwMjAvNy8yOCDkuIvljYg1OjA0LCBFbGkgQ29oZW4gd3JvdGU6Cj4gT24gVHVlLCBKdWwg
MjgsIDIwMjAgYXQgMTI6MjQ6MDNQTSArMDgwMCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+PiAgIAo+
PiArc3RhdGljIHZvaWQgdmhvc3RfdmRwYV9zZXR1cF92cV9pcnEoc3RydWN0IHZob3N0X3ZkcGEg
KnYsIGludCBxaWQpCj4+ICt7Cj4+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEgPSAmdi0+
dnFzW3FpZF07Cj4+ICsJY29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdi0+dmRw
YS0+Y29uZmlnOwo+PiArCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7Cj4+ICsJ
aW50IHJldCwgaXJxOwo+PiArCj4+ICsJc3Bpbl9sb2NrKCZ2cS0+Y2FsbF9jdHguY3R4X2xvY2sp
Owo+PiArCWlycSA9IG9wcy0+Z2V0X3ZxX2lycSh2ZHBhLCBxaWQpOwo+PiArCWlmICghdnEtPmNh
bGxfY3R4LmN0eCB8fCBpcnEgPT0gLUVJTlZBTCkgewo+PiArCQlzcGluX3VubG9jaygmdnEtPmNh
bGxfY3R4LmN0eF9sb2NrKTsKPj4gKwkJcmV0dXJuOwo+PiArCX0KPj4gKwo+IElmIEkgdW5kZXJz
dGFuZCBjb3JyZWN0bHksIHRoaXMgd2lsbCBjYXVzZSB0aGVzZSBJUlFzIHRvIGJlIGZvcndhcmRl
ZAo+IGRpcmVjdGx5IHRvIHRoZSBWQ1BVLCBlLmcuIHdpbGwgYmUgaGFuZGxlZCBieSB0aGUgZ3Vl
c3QvcWVtdS4KCgpZZXMsIGlmIGl0IGNhbiBieXBhc3NlZCwgdGhlIGludGVycnVwdCB3aWxsIGJl
IGRlbGl2ZXJlZCB0byB2Q1BVIGRpcmVjdGx5LgoKCj4gRG9lcyB0aGlzIG1lYW4gdGhhdCB0aGUg
aG9zdCB3aWxsIG5vdCBoYW5kbGUgdGhpcyBpbnRlcnJ1cHQ/IEhvdyBkb2VzIGl0Cj4gd29yayBp
biBjYXNlIG9uIGxldmVsIHRyaWdnZXJlZCBpbnRlcnJ1cHRzPwoKClRoZXJlJ3Mgbm8gZ3VhcmFu
dGVlIHRoYXQgdGhlIEtWTSBhcmNoIGNvZGUgY2FuIG1ha2Ugc3VyZSB0aGUgaXJxIGJ5cGFzcyAK
d29yayBmb3IgYW55IHR5cGUgb2YgaXJxLiBTbyBpZiB0aGV5IHRoZSBpcnEgd2lsbCBzdGlsbCBu
ZWVkIHRvIGJlIApoYW5kbGVkIGJ5IGhvc3QgZmlyc3QuIFRoaXMgbWVhbnMgd2Ugc2hvdWxkIGtl
ZXAgdGhlIGhvc3QgaW50ZXJydXB0IApoYW5kbGVyIGFzIGEgc2xvd3BhdGggKGZhbGxiYWNrKS4K
Cgo+Cj4gSW4gdGhlIGNhc2Ugb2YgQ29ubmVjdFgsIEkgbmVlZCB0byBleGVjdXRlIHNvbWUgY29k
ZSB0byBhY2tub3dsZWRnZSB0aGUKPiBpbnRlcnJ1cHQuCgoKVGhpcyB0dXJucyBvdXQgdG8gYmUg
aGFyZCBmb3IgaXJxIGJ5cGFzc2luZyB0byB3b3JrLiBJcyBpdCBiZWNhdXNlIHRoZSAKaXJxIGlz
IHNoYXJlZCBvciB3aGF0IGtpbmQgb2YgYWNrIHlvdSBuZWVkIHRvIGRvPwoKVGhhbmtzCgoKPgo+
IENhbiB5b3UgZXhwbGFpbiBob3cgdGhpcyBzaG91bGQgYmUgZG9uZT8KPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u

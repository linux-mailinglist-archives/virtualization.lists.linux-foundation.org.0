Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C39331CDB
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 03:18:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0EFF6F5DF;
	Tue,  9 Mar 2021 02:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80hdDpNS7SHM; Tue,  9 Mar 2021 02:18:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998656F5D8;
	Tue,  9 Mar 2021 02:18:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D1C6C0001;
	Tue,  9 Mar 2021 02:18:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09722C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECDF26F55D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjwC6uEvjlkB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:18:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8713605CC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615256305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcShwLoJWnpEZpwYw3XT7sfmNyFh50D0tcu/Ys15ACw=;
 b=Xl/nDcYcvmw2geBsxOImbRY8FeHfBxdFEF4vjSRXKAiZqOlhwSBj7JizoXZ8MsYk8WUdFE
 CCCuXCBNrMeXEF5yfG2IsrS6VqKxJnxytKtCotXn/PgoJaJwYPWa9ljm45dTleCkJOZ0JN
 vo60GOQzzunNTSzW8ffuBRpkjxABVbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Yjo8hpWsNR6Gv8zljaCtoQ-1; Mon, 08 Mar 2021 21:18:20 -0500
X-MC-Unique: Yjo8hpWsNR6Gv8zljaCtoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0E2C80432D;
 Tue,  9 Mar 2021 02:18:18 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-202.pek2.redhat.com
 [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61C0D5C27C;
 Tue,  9 Mar 2021 02:18:12 +0000 (UTC)
Subject: Re: [PATCH V2 1/4] vDPA/ifcvf: get_vendor_id returns a device
 specific vendor id
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com
References: <20210308083525.382514-1-lingshan.zhu@intel.com>
 <20210308083525.382514-2-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <2a7b9cba-620f-a447-7de6-0b9dc74817ba@redhat.com>
Date: Tue, 9 Mar 2021 10:18:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308083525.382514-2-lingshan.zhu@intel.com>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMy84IDQ6MzUg5LiL5Y2ILCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gSW4gdGhpcyBj
b21taXQsIGlmY3ZmX2dldF92ZW5kb3JfaWQoKSB3aWxsIHJldHVybgo+IGEgZGV2aWNlIHNwZWNp
ZmljIHZlbmRvciBpZCBvZiB0aGUgcHJvYmVkIHBjaSBkZXZpY2UKPiB0aGFuIGEgaGFyZCBjb2Rl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29t
PgoKCkFja2VkLWJ5OiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4gLS0tCj4g
ICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZf
bWFpbi5jCj4gaW5kZXggZmExYWYzMDFjZjU1Li5lNTAxZWUwN2RlMTcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvdmRwYS9pZmN2
Zi9pZmN2Zl9tYWluLmMKPiBAQCAtMzI0LDcgKzMyNCwxMCBAQCBzdGF0aWMgdTMyIGlmY3ZmX3Zk
cGFfZ2V0X2RldmljZV9pZChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGFfZGV2KQo+ICAgCj4gICBz
dGF0aWMgdTMyIGlmY3ZmX3ZkcGFfZ2V0X3ZlbmRvcl9pZChzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZk
cGFfZGV2KQo+ICAgewo+IC0JcmV0dXJuIElGQ1ZGX1NVQlNZU19WRU5ET1JfSUQ7Cj4gKwlzdHJ1
Y3QgaWZjdmZfYWRhcHRlciAqYWRhcHRlciA9IHZkcGFfdG9fYWRhcHRlcih2ZHBhX2Rldik7Cj4g
KwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IGFkYXB0ZXItPnBkZXY7Cj4gKwo+ICsJcmV0dXJuIHBk
ZXYtPnN1YnN5c3RlbV92ZW5kb3I7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB1MzIgaWZjdmZfdmRw
YV9nZXRfdnFfYWxpZ24oc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhX2RldikKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==

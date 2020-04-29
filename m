Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4431BD8DE
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 11:57:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7CDE722FD5;
	Wed, 29 Apr 2020 09:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZ69s9HPKloS; Wed, 29 Apr 2020 09:57:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99CEA2302C;
	Wed, 29 Apr 2020 09:57:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A9FAC0172;
	Wed, 29 Apr 2020 09:57:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 964F0C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 67DBB88180
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id taAlffBEHVMK
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:57:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 30BBC81AD1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588154223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2AKHlh6SiVDuPjrCtmpcayjgfOKgmfzlgzuptbydd0=;
 b=OvQyR8Lw4UwzLSPACllDBM6ZvTTNzNFNo0RK4xiAzTtNxRRxkHduIucjyKzfuto8PTvoH8
 qYNro/pdFiNFivsqyoc3lDo2T4Gatu02Diieo0txZdlMfGXgTiknkzhG3sVkKeyh2fPGzb
 EgUa2CfC4ip4v7gQL124vktHm1bXNMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-rIia7EAdOsmJBNbOFlwYEA-1; Wed, 29 Apr 2020 05:56:58 -0400
X-MC-Unique: rIia7EAdOsmJBNbOFlwYEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D033880B714;
 Wed, 29 Apr 2020 09:56:57 +0000 (UTC)
Received: from [10.72.13.2] (ovpn-13-2.pek2.redhat.com [10.72.13.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC5260C84;
 Wed, 29 Apr 2020 09:56:49 +0000 (UTC)
Subject: Re: [PATCH 0/1] Add uvirtio for testing
To: Lepton Wu <ytht.net@gmail.com>, virtualization@lists.linux-foundation.org
References: <20200428204729.64569-1-ytht.net@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b01454e9-bca8-cf32-7cfa-ebe25032e040@redhat.com>
Date: Wed, 29 Apr 2020 17:56:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428204729.64569-1-ytht.net@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mst@redhat.com
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

Ck9uIDIwMjAvNC8yOSDkuIrljYg0OjQ3LCBMZXB0b24gV3Ugd3JvdGU6Cj4gVGhpcyBpcyBhIHdh
eSB0byBjcmVhdGUgdmlydGlvIGJhc2VkIGRldmljZXMgZnJvbSB1c2VyIHNwYWNlLiBUaGlzIGlz
IHRoZQo+IGJhY2tncm91bmQgZm9yIHRoaXMgcGF0Y2g6Cj4KPiBXZSBoYXZlIHNvbWUgaW1hZ2Vz
IHdvcmtzIGZpbmUgdW5kZXIgcWVtdSwgd2UnZCBsaWtlIHRvIGFsc28gcnVuIHRoZSBzYW1lIGlt
YWdlCj4gb24gR29vZ2xlIENsb3VkLiBDdXJyZW50bHkgR29vZ2xlIENsb3VkIGRvZXNuJ3Qgc3Vw
cG9ydCB2aXJ0aW8tdmdhLiBJIGhhZCBhCj4gcGF0Y2ggdG8gY3JlYXRlIGEgdmlydGlvLXZnYSBm
cm9tIGtlcm5lbCBkaXJlY3RseToKPiBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmkt
ZGV2ZWwvbXNnMjQ4NTczLmh0bWwKPgo+IFRoZW4gSSBnb3QgZmVlZGJhY2sgZnJvbSBHZXJkIHRo
YXQgbWF5YmUgaXQncyBiZXR0ZXIgdG8gY2hhbmdlIHRoYXQgdG8gc29tZXRoaW5nCj4gbGlrZSB1
dmlydGlvLiBTaW5jZSBJIHJlYWxseSBkb24ndCBoYXZlIG90aGVyIHVzZSBjYXNlcyBmb3Igbm93
LCBJIGp1c3QgaW1wbGVtZW50ZWQgdGhlIG1pbmltYWwgc3R1ZmYgd2hpY2ggd29yayBmb3IgbXkg
dXNlIGNhc2UuCgoKSW50ZXJlc3RpbmcsIHNldmVyYWwgcXVlc3Rpb25zOgoKMSkgQXJlIHlvdSBh
d2FyZSBvZiB2aXJ0aW8gdmhvc3QtdXNlciBkcml2ZXIgZG9uZSBieSBVTSBndXlzPyAKKGFyY2gv
dW0vZHJpdmVycy92aXJ0aW9fdW1sLmMpIFRoZSBtZW1vcnkgcGFydCBpcyB0cmlja3kgYnV0IG92
ZXJhbGwgCmJvdGggb2YgeW91IGhhdmUgc2ltaWxhciB0YXJnZXQuCjIpIFBhdGNoIDEgc2FpZCBp
dCdzIHVzZXJzcGFjZSB2aXJ0aW8gZHJpdmVyLCB3aGljaCBJIHRoaW5rIGl0IGlzIAphY3R1YWxs
eSAidXNlcnNwYWNlIHZpcnRpbyBkZXZpY2UiCjMpIE5lZWQgdG8gYmUgdmVyYm9zZSBvbiBob3cg
dGhlIHZyaW5nIHByb2Nlc3Npbmcgd29yayBpbiB0aGUgY29tbWl0IGxvZyAKb2YgcGF0Y2ggMQo0
KSBJJ20gY3VyaW91cyB3aGljaCB0ZXN0aW5nIHlvdSB3YW50IHRvIGFjY29tcGxpc2ggdGhyb3Vn
aCB0aGlzIG5ldyAKdHJhbnNwb3J0LCBJIGd1ZXNzIHlvdSB3YW50IHRvIHRlc3QgYSBzcGVjaWZp
YyB2aXJ0aW8gZHJpdmVyPwo1KSBZb3UgbWVudGlvbmVkIHRoYXQgeW91IG1heSB3YW50IHRvIGRl
dmVsb3AgY29tbXVuaWNhdGlvbiBiZXR3ZWVuIAprZXJuZWwgYW5kIHVzZXJzcGFjZSwgYW55IG1v
cmUgZGV0YWlscyBvbiB0aGF0PwoKVGhhbmtzCgoKPgo+IExlcHRvbiBXdSAoMSk6Cj4gICAgdmly
dGlvOiBBZGQgdXZpcnRpbyBkcml2ZXIKPgo+ICAgZHJpdmVycy92aXJ0aW8vS2NvbmZpZyAgICAg
ICAgfCAgIDggKwo+ICAgZHJpdmVycy92aXJ0aW8vTWFrZWZpbGUgICAgICAgfCAgIDEgKwo+ICAg
ZHJpdmVycy92aXJ0aW8vdXZpcnRpby5jICAgICAgfCA0MDUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAgaW5jbHVkZS9saW51eC91dmlydGlvLmggICAgICAgfCAgIDggKwo+
ICAgaW5jbHVkZS91YXBpL2xpbnV4L3V2aXJ0aW8uaCAgfCAgNjkgKysrKysrCj4gICBzYW1wbGVz
L3V2aXJ0aW8vTWFrZWZpbGUgICAgICB8ICAgOSArCj4gICBzYW1wbGVzL3V2aXJ0aW8vdXZpcnRp
by12Z2EuYyB8ICA2MyArKysrKysKPiAgIDcgZmlsZXMgY2hhbmdlZCwgNTYzIGluc2VydGlvbnMo
KykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpcnRpby91dmlydGlvLmMKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3V2aXJ0aW8uaAo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGluY2x1ZGUvdWFwaS9saW51eC91dmlydGlvLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBzYW1wbGVzL3V2aXJ0aW8vTWFrZWZpbGUKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBzYW1wbGVz
L3V2aXJ0aW8vdXZpcnRpby12Z2EuYwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

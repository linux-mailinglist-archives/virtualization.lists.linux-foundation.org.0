Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AB72920C67F
	for <lists.virtualization@lfdr.de>; Sun, 28 Jun 2020 08:35:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29D4787C74;
	Sun, 28 Jun 2020 06:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NwIjsLdVtQGB; Sun, 28 Jun 2020 06:35:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 624D686E33;
	Sun, 28 Jun 2020 06:35:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41328C016E;
	Sun, 28 Jun 2020 06:35:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36280C016E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E65586931
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTlsCGQLXLnl
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:35:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 11D0F868DE
 for <virtualization@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593326100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhEZEqP2gOLLuRIAsrUzWdxl5PbmR38JJbcII9F4Ac4=;
 b=aO/r0+YrkQfek1PApjd0W+zNq9HsBm6we7E0fZ4znrborKusBP4PQYDb3xzKcrXuhM2yHh
 cdnXWw8y82OpbsCK57Ykx5sRVAwhm1aSnTs2kfgd2DFPwq36MHBqHwz99VaZ89NbpW49AP
 wuS2Dq2u1XuYq9xDf4rUTjZ52QmDOuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-vCOxReYvN-OiXDQQ_CFRiw-1; Sun, 28 Jun 2020 02:34:58 -0400
X-MC-Unique: vCOxReYvN-OiXDQQ_CFRiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6761980183C;
 Sun, 28 Jun 2020 06:34:57 +0000 (UTC)
Received: from [10.72.13.164] (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497F55BAD6;
 Sun, 28 Jun 2020 06:34:45 +0000 (UTC)
Subject: Re: [RFC 0/3] virtio: NUMA-aware memory allocation
To: Stefan Hajnoczi <stefanha@redhat.com>, kvm@vger.kernel.org
References: <20200625135752.227293-1-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9cd725b5-4954-efd9-4d1b-3a448a436472@redhat.com>
Date: Sun, 28 Jun 2020 14:34:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625135752.227293-1-stefanha@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
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

Ck9uIDIwMjAvNi8yNSDkuIvljYg5OjU3LCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6Cj4gVGhlc2Ug
cGF0Y2hlcyBhcmUgbm90IHJlYWR5IHRvIGJlIG1lcmdlZCBiZWNhdXNlIEkgd2FzIHVuYWJsZSB0
byBtZWFzdXJlIGEKPiBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudC4gSSdtIHB1Ymxpc2hpbmcgdGhl
bSBzbyB0aGV5IGFyZSBhcmNoaXZlZCBpbiBjYXNlCj4gc29tZW9uZSBwaWNrcyB1cCB0aGlzIHdv
cmsgYWdhaW4gaW4gdGhlIGZ1dHVyZS4KPgo+IFRoZSBnb2FsIG9mIHRoZXNlIHBhdGNoZXMgaXMg
dG8gYWxsb2NhdGUgdmlydHF1ZXVlcyBhbmQgZHJpdmVyIHN0YXRlIGZyb20gdGhlCj4gZGV2aWNl
J3MgTlVNQSBub2RlIGZvciBvcHRpbWFsIG1lbW9yeSBhY2Nlc3MgbGF0ZW5jeS4gT25seSBndWVz
dHMgd2l0aCBhIHZOVU1BCj4gdG9wb2xvZ3kgYW5kIHZpcnRpbyBkZXZpY2VzIHNwcmVhZCBhY3Jv
c3Mgdk5VTUEgbm9kZXMgYmVuZWZpdCBmcm9tIHRoaXMuICBJbgo+IG90aGVyIGNhc2VzIHRoZSBt
ZW1vcnkgcGxhY2VtZW50IGlzIGZpbmUgYW5kIHdlIGRvbid0IG5lZWQgdG8gdGFrZSBOVU1BIGlu
dG8KPiBhY2NvdW50IGluc2lkZSB0aGUgZ3Vlc3QuCj4KPiBUaGVzZSBwYXRjaGVzIGNvdWxkIGJl
IGV4dGVuZGVkIHRvIHZpcnRpb19uZXQua28gYW5kIG90aGVyIGRldmljZXMgaW4gdGhlCj4gZnV0
dXJlLiBJIG9ubHkgdGVzdGVkIHZpcnRpb19ibGsua28uCj4KPiBUaGUgYmVuY2htYXJrIGNvbmZp
Z3VyYXRpb24gd2FzIGRlc2lnbmVkIHRvIHRyaWdnZXIgd29yc3QtY2FzZSBOVU1BIHBsYWNlbWVu
dDoKPiAgICogUGh5c2ljYWwgTlZNZSBzdG9yYWdlIGNvbnRyb2xsZXIgb24gaG9zdCBOVU1BIG5v
ZGUgMAo+ICAgKiBJT1RocmVhZCBwaW5uZWQgdG8gaG9zdCBOVU1BIG5vZGUgMAo+ICAgKiB2aXJ0
aW8tYmxrLXBjaSBkZXZpY2UgaW4gdk5VTUEgbm9kZSAxCj4gICAqIHZDUFUgMCBvbiBob3N0IE5V
TUEgbm9kZSAxIGFuZCB2Q1BVIDEgb24gaG9zdCBOVU1BIG5vZGUgMAo+ICAgKiB2Q1BVIDAgaW4g
dk5VTUEgbm9kZSAwIGFuZCB2Q1BVIDEgaW4gdk5VTUEgbm9kZSAxCj4KPiBUaGUgaW50ZW50IGlz
IHRvIGhhdmUgLnByb2JlKCkgY29kZSBydW4gb24gdkNQVSAwIGluIHZOVU1BIG5vZGUgMCAoaG9z
dCBOVU1BCj4gbm9kZSAxKSBzbyB0aGF0IG1lbW9yeSBpcyBpbiB0aGUgd3JvbmcgTlVNQSBub2Rl
IGZvciB0aGUgdmlydGlvLWJsay1wY2kgZGV2aWM9Cj4gZS4KPiBBcHBseWluZyB0aGVzZSBwYXRj
aGVzIGZpeGVzIG1lbW9yeSBwbGFjZW1lbnQgc28gdGhhdCB2aXJ0cXVldWVzIGFuZCBkcml2ZXIK
PiBzdGF0ZSBpcyBhbGxvY2F0ZWQgaW4gdk5VTUEgbm9kZSAxIHdoZXJlIHRoZSB2aXJ0aW8tYmxr
LXBjaSBkZXZpY2UgaXMgbG9jYXRlZC4KPgo+IFRoZSBmaW8gNEtCIHJhbmRyZWFkIGJlbmNobWFy
ayByZXN1bHRzIGRvIG5vdCBzaG93IGEgc2lnbmlmaWNhbnQgaW1wcm92ZW1lbnQ6Cj4KPiBOYW1l
ICAgICAgICAgICAgICAgICAgSU9QUyAgIEVycm9yCj4gdmlydGlvLWJsayAgICAgICAgNDIzNzMu
NzkgPUMyPUIxIDAuNTQlCj4gdmlydGlvLWJsay1udW1hICAgNDI1MTcuMDcgPUMyPUIxIDAuNzkl
CgoKSSByZW1lbWJlciBJIGRpZCBzb21ldGhpbmcgc2ltaWxhciBpbiB2aG9zdCBieSB1c2luZyBw
YWdlX3RvX25pZCgpIGZvciAKZGVzY3JpcHRvciByaW5nLiBBbmQgSSBnZXQgbGl0dGxlIGltcHJv
dmVtZW50IGFzIHNob3duIGhlcmUuCgpNaWNoYWVsIHJlbWluZHMgdGhhdCBpdCB3YXMgcHJvYmFi
bHkgYmVjYXVzZSBhbGwgZGF0YSB3ZXJlIGNhY2hlZC4gU28gSSAKZG91YnQgaWYgdGhlIHRlc3Qg
bGFja3Mgc3VmZmljaWVudCBzdHJlc3Mgb24gdGhlIGNhY2hlIC4uLgoKVGhhbmtzCgoKPgo+IFN0
ZWZhbiBIYWpub2N6aSAoMyk6Cj4gICAgdmlydGlvLXBjaTogdXNlIE5VTUEtYXdhcmUgbWVtb3J5
IGFsbG9jYXRpb24gaW4gcHJvYmUKPiAgICB2aXJ0aW9fcmluZzogdXNlIE5VTUEtYXdhcmUgbWVt
b3J5IGFsbG9jYXRpb24gaW4gcHJvYmUKPiAgICB2aXJ0aW8tYmxrOiB1c2UgTlVNQS1hd2FyZSBt
ZW1vcnkgYWxsb2NhdGlvbiBpbiBwcm9iZQo+Cj4gICBpbmNsdWRlL2xpbnV4L2dmcC5oICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svdmlydGlvX2Jsay5jICAgICAgICAg
fCAgNyArKysrKy0tCj4gICBkcml2ZXJzL3ZpcnRpby92aXJ0aW9fcGNpX2NvbW1vbi5jIHwgMTYg
KysrKysrKysrKysrLS0tLQo+ICAgZHJpdmVycy92aXJ0aW8vdmlydGlvX3JpbmcuYyAgICAgICB8
IDI2ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4gICBtbS9wYWdlX2FsbG9jLmMgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCj4KPiAtLT0yMAo+IDIuMjYuMgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

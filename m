Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFA9198E04
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 10:10:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 061D287678;
	Tue, 31 Mar 2020 08:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ruy3OIeK8rit; Tue, 31 Mar 2020 08:10:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A698087684;
	Tue, 31 Mar 2020 08:10:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85B4AC07FF;
	Tue, 31 Mar 2020 08:10:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94918C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 83CF587666
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9JdLwuXwICX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:10:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 828ED863BE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585642240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QowiphZETTq04QwDokDwsv9WQCJrcAvZuUSYA+aVq8=;
 b=b8b5eqgwgC38WWa4JAM1gc/iPSWIvUUB6R85vfTZNg9tt+2fert3u88uQZgVL3fJT9GEy6
 tAUZKjJp6J99oq3pL8vqJh/nbOpORfwWjZfPJKV+tZsChWE5wOyHteAUF3SdpRVe343oi3
 pdHyWuRqp9xI1n1Y+38HM+dm4/9A8DY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-AYnVJ3i4MXeX8hl8QMJuXg-1; Tue, 31 Mar 2020 04:10:34 -0400
X-MC-Unique: AYnVJ3i4MXeX8hl8QMJuXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A29BC8017DF;
 Tue, 31 Mar 2020 08:10:33 +0000 (UTC)
Received: from [10.72.12.115] (ovpn-12-115.pek2.redhat.com [10.72.12.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2500A101D480;
 Tue, 31 Mar 2020 08:10:28 +0000 (UTC)
Subject: Re: [vhost:linux-next 8/13] include/linux/vringh.h:18:10: fatal
 error: linux/vhost_iotlb.h: No such file or directory
To: "Xia, Hui" <hui.xia@intel.com>, lkp <lkp@intel.com>
References: <202003292026.dP7OOeCi%lkp@intel.com>
 <f1270de5-7a2c-76d2-431c-34364def851a@redhat.com>
 <2A5F4C9150EECB4DAA6291810D6D61B9745B7754@shsmsx102.ccr.corp.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ba85a677-85a8-b7d3-1401-4ac7674c8f3c@redhat.com>
Date: Tue, 31 Mar 2020 16:10:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2A5F4C9150EECB4DAA6291810D6D61B9745B7754@shsmsx102.ccr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

Ck9uIDIwMjAvMy8zMSDkuIvljYgzOjMxLCBYaWEsIEh1aSB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+
PiBTZW50OiAyMDIw5bm0M+aciDMw5pelIDEwOjQ3Cj4+IFRvOiBsa3A8bGtwQGludGVsLmNvbT4K
Pj4gQ2M6a2J1aWxkLWFsbEBsaXN0cy4wMS5vcmc7a3ZtQHZnZXIua2VybmVsLm9yZzt2aXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC0KPj4gZm91bmRhdGlvbi5vcmc7bmV0ZGV2QHZnZXIua2VybmVs
Lm9yZzsgTWljaGFlbCBTLiBUc2lya2luPG1zdEByZWRoYXQuY29tPgo+PiBTdWJqZWN0OiBSZTog
W3Zob3N0OmxpbnV4LW5leHQgOC8xM10gaW5jbHVkZS9saW51eC92cmluZ2guaDoxODoxMDogZmF0
YWwgZXJyb3I6Cj4+IGxpbnV4L3Zob3N0X2lvdGxiLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKPj4KPj4KPj4gT24gMjAyMC8zLzI5IOS4i+WNiDg6MDgsIGtidWlsZCB0ZXN0IHJvYm90IHdy
b3RlOgo+Pj4gdHJlZTpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9tc3Qvdmhvc3QuZ2l0ICBsaW51eC1uZXh0Cj4+PiBoZWFkOiAgIGY0NGE2M2Y5ZWJmNjZh
NDUwYzEwMTA4NGEzNWEzZWYxNThlYWQyMDkKPj4+IGNvbW1pdDogYzQzOTA4YjBiOWE5MDBiZDUx
Zjg2MWY0YzU3YjgzY2ZkOTMyZjRkMiBbOC8xM10gdnJpbmdoOiBJT1RMQgo+Pj4gc3VwcG9ydAo+
Pj4gY29uZmlnOiBhcm0tZW1feDI3MF9kZWZjb25maWcgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4+
PiBjb21waWxlcjogYXJtLWxpbnV4LWdudWVhYmktZ2NjIChHQ0MpIDkuMy4wCj4+PiByZXByb2R1
Y2U6Cj4+PiAgICAgICAgICAgd2dldGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9p
bnRlbC9sa3AtCj4+IHRlc3RzL21hc3Rlci9zYmluL21ha2UuY3Jvc3MgLU8gfi9iaW4vbWFrZS5j
cm9zcwo+Pj4gICAgICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MKPj4+ICAgICAgICAg
ICBnaXQgY2hlY2tvdXQgYzQzOTA4YjBiOWE5MDBiZDUxZjg2MWY0YzU3YjgzY2ZkOTMyZjRkMgo+
PiBJIGNvdWxkIG5vdCBmaW5kIHRoaXMgY29tbWl0IGluIHRoZSBhYm92ZSBicmFuY2guCj4+Cj4+
Cj4+PiAgICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRvIGxpbnV4IGJ1aWxk
IHRyZWUKPj4+ICAgICAgICAgICBHQ0NfVkVSU0lPTj05LjMuMCBtYWtlLmNyb3NzIEFSQ0g9YXJt
Cj4+IFRyeSB0byB1c2UgY29tbWl0IGRjM2IwNjczYWU1ZWZiNzNlZGFiNjZlYzVjMmYwNzQyNzJl
OWE0ZGYuCj4+Cj4+IEJ1dCB0aGlzIGNvbW1hbmQgZG9lcyBub3Qgd29yayAoSSByZW1lbWJlciBp
dCB1c2VkIHRvIHdvcmspOgo+Pgo+PiAjIEdDQ19WRVJTSU9OPTkuMy4wIG1ha2UuY3Jvc3MgQVJD
SD1hcm0KPj4gY2Q6IHJlY2VpdmVkIHJlZGlyZWN0aW9uIHRvCj4+IGBodHRwczovL2Rvd25sb2Fk
LjAxLm9yZy8wZGF5LWNpL2Nyb3NzLXBhY2thZ2UvJwo+PiBsZnRwZ2V0IC1jCj4+IGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvY3Jvc3MtcGFja2FnZS8uL2djYy05LjMuMC1ub2xpYmMv
eDg2XzY0LWdjYy0KPj4gOS4zLjAtbm9saWJjX2FybS1saW51eC1nbnVlYWJpaGYudGFyLnh6Cj4+
IHRhciBKeGYKPj4gZ2NjLTkuMy4wLW5vbGliYy94ODZfNjQtZ2NjLTkuMy4wLW5vbGliY19hcm0t
bGludXgtZ251ZWFiaWhmLnRhci54eiAtQwo+PiAvcm9vdC8wZGF5IE5vIGNyb3NzIGNvbXBpbGVy
IGZvciBhcm0gc2V0dXBfY3Jvc3N0b29sIGZhaWxlZAo+IEhpIEphc29uLCB0aGFua3MgZm9yIHJl
cG9ydCB0aGlzIGlzc3VlLiBJdCBpcyBjYXVzZWQgYnkgd3JvbmcgZmluZGluZyBpbiAyIGNyb3Nz
IHRvb2xzIGZvciBhcm0uIEFuZCBoYXMgYmVlbiBmaXhlZC4gVGhhbmtzLgo+IFJlZ2FyZGluZyB0
byB0aGUgdmhvc3QgYnVpbGQgaXNzdWUgaXRzZWxmLCBpdCBoYXMgZ29uZSBpbiBsYXRlc3Qgdmhv
c3QvbGludXgtbmV4dC4gVGhlIGNhdXNlIGlzIHRoZSBjb2RlIGtidWlsZCBjYXB0dXJlZCBkaWRu
J3QgaGF2ZSAgcGF0Y2ggIiB2aG9zdDogZmFjdG9yIG91dCBJT1RMQiAiIHdoaWNoIGludHJvZHVj
ZSBsaW51eC92aG9zdF9pb3RsYi5oIGF0IHRoYXQgbW9tZW50LiBTbyBqdXN0IGlnbm9yZSB0aGlz
IGlzc3VlIHNpbmNlIHRoZSBtaXNzZWQgcGF0Y2ggaGFzIGJlZW4gYWRkZWQgaW4gbGF0ZXN0IHZo
b3N0L2xpbnV4LW5leHQuCgoKR29vZCB0byBrbm93IHRoaXMuCgpUaGFua3MgZm9yIHRoZSB1cGRh
dGluZy4KCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=

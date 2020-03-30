Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 558411972A3
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 04:47:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D4F885FB4;
	Mon, 30 Mar 2020 02:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzoiLf97vUW7; Mon, 30 Mar 2020 02:47:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83E6A860CD;
	Mon, 30 Mar 2020 02:47:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78479C07FF;
	Mon, 30 Mar 2020 02:47:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD8FEC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 02:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C25D32045C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 02:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ql-wFfMD17M9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 02:47:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by silver.osuosl.org (Postfix) with ESMTPS id C82C12045A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 02:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585536423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhRKQgYj4kt2ErgAvEa/JDhR6aA1zygUgBsUozFxa0s=;
 b=hStN2K64k2EeR65TiXrzdCBpaciwrVu4KcCJ/vPuDSvWZoH/V/6gB12U/RXgc7sMQeZYDY
 mmWYpVcM+0uvkXAJVX4HYuozj3XZLI99Vv4gC97H/p3sdvrNmr0MPVAQw0w53oZU0Eph17
 c7iDVSDDb50oClyUzPXzFlB8J2SoFGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-MDKfgYK0N4qCpGOTf-DT-A-1; Sun, 29 Mar 2020 22:46:43 -0400
X-MC-Unique: MDKfgYK0N4qCpGOTf-DT-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D40D81902EA8;
 Mon, 30 Mar 2020 02:46:41 +0000 (UTC)
Received: from [10.72.12.125] (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 836828F342;
 Mon, 30 Mar 2020 02:46:36 +0000 (UTC)
Subject: Re: [vhost:linux-next 8/13] include/linux/vringh.h:18:10: fatal
 error: linux/vhost_iotlb.h: No such file or directory
To: kbuild test robot <lkp@intel.com>
References: <202003292026.dP7OOeCi%lkp@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f1270de5-7a2c-76d2-431c-34364def851a@redhat.com>
Date: Mon, 30 Mar 2020 10:46:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <202003292026.dP7OOeCi%lkp@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 kbuild-all@lists.01.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvMy8yOSDkuIvljYg4OjA4LCBrYnVpbGQgdGVzdCByb2JvdCB3cm90ZToKPiB0cmVl
OiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21zdC92
aG9zdC5naXQgbGludXgtbmV4dAo+IGhlYWQ6ICAgZjQ0YTYzZjllYmY2NmE0NTBjMTAxMDg0YTM1
YTNlZjE1OGVhZDIwOQo+IGNvbW1pdDogYzQzOTA4YjBiOWE5MDBiZDUxZjg2MWY0YzU3YjgzY2Zk
OTMyZjRkMiBbOC8xM10gdnJpbmdoOiBJT1RMQiBzdXBwb3J0Cj4gY29uZmlnOiBhcm0tZW1feDI3
MF9kZWZjb25maWcgKGF0dGFjaGVkIGFzIC5jb25maWcpCj4gY29tcGlsZXI6IGFybS1saW51eC1n
bnVlYWJpLWdjYyAoR0NDKSA5LjMuMAo+IHJlcHJvZHVjZToKPiAgICAgICAgICB3Z2V0IGh0dHBz
Oi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4v
bWFrZS5jcm9zcyAtTyB+L2Jpbi9tYWtlLmNyb3NzCj4gICAgICAgICAgY2htb2QgK3ggfi9iaW4v
bWFrZS5jcm9zcwo+ICAgICAgICAgIGdpdCBjaGVja291dCBjNDM5MDhiMGI5YTkwMGJkNTFmODYx
ZjRjNTdiODNjZmQ5MzJmNGQyCgoKSSBjb3VsZCBub3QgZmluZCB0aGlzIGNvbW1pdCBpbiB0aGUg
YWJvdmUgYnJhbmNoLgoKCj4gICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAuY29uZmlnIHRv
IGxpbnV4IGJ1aWxkIHRyZWUKPiAgICAgICAgICBHQ0NfVkVSU0lPTj05LjMuMCBtYWtlLmNyb3Nz
IEFSQ0g9YXJtCgoKVHJ5IHRvIHVzZSBjb21taXQgZGMzYjA2NzNhZTVlZmI3M2VkYWI2NmVjNWMy
ZjA3NDI3MmU5YTRkZi4KCkJ1dCB0aGlzIGNvbW1hbmQgZG9lcyBub3Qgd29yayAoSSByZW1lbWJl
ciBpdCB1c2VkIHRvIHdvcmspOgoKIyBHQ0NfVkVSU0lPTj05LjMuMCBtYWtlLmNyb3NzIEFSQ0g9
YXJtCmNkOiByZWNlaXZlZCByZWRpcmVjdGlvbiB0byAKYGh0dHBzOi8vZG93bmxvYWQuMDEub3Jn
LzBkYXktY2kvY3Jvc3MtcGFja2FnZS8nCmxmdHBnZXQgLWMgCmh0dHBzOi8vZG93bmxvYWQuMDEu
b3JnLzBkYXktY2kvY3Jvc3MtcGFja2FnZS8uL2djYy05LjMuMC1ub2xpYmMveDg2XzY0LWdjYy05
LjMuMC1ub2xpYmNfYXJtLWxpbnV4LWdudWVhYmloZi50YXIueHoKdGFyIEp4ZiAKZ2NjLTkuMy4w
LW5vbGliYy94ODZfNjQtZ2NjLTkuMy4wLW5vbGliY19hcm0tbGludXgtZ251ZWFiaWhmLnRhci54
eiAtQyAKL3Jvb3QvMGRheQpObyBjcm9zcyBjb21waWxlciBmb3IgYXJtCnNldHVwX2Nyb3NzdG9v
bCBmYWlsZWQKCgo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZwo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPgo+
IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPgo+ICAgICBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC92aXJ0aW8uaDoxMiwKPiAgICAgICAgICAgICAgICAg
ICAgICBmcm9tIGluY2x1ZGUvbGludXgvdmlydGlvX2NvbmZpZy5oOjcsCj4gICAgICAgICAgICAg
ICAgICAgICAgZnJvbSBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX25ldC5oOjMwLAo+ICAgICAg
ICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0Lmg6NiwKPiAgICAg
ICAgICAgICAgICAgICAgICBmcm9tIG5ldC8vcGFja2V0L2FmX3BhY2tldC5jOjgyOgo+Pj4gaW5j
bHVkZS9saW51eC92cmluZ2guaDoxODoxMDogZmF0YWwgZXJyb3I6IGxpbnV4L3Zob3N0X2lvdGxi
Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAgICAgICAgMTggfCAjaW5jbHVkZSA8bGlu
dXgvdmhvc3RfaW90bGIuaD4KPiAgICAgICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn4KPiAgICAgY29tcGlsYXRpb24gdGVybWluYXRlZC4KPgo+IHZpbSArMTggaW5jbHVkZS9s
aW51eC92cmluZ2guaAo+Cj4gICAgPiAxOAkjaW5jbHVkZSA8bGludXgvdmhvc3RfaW90bGIuaD4K
PiAgICAgIDE5CSNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ICAgICAgMjAJCgoKSSBjYW4gaGFy
ZGx5IGJlbGlldmUgaXQgY2FuJ3Qgd29yay4KCkkgZ2V0CgojIGZpbGUgaW5jbHVkZS9saW51eC92
cmluZ2guaAppbmNsdWRlL2xpbnV4L3ZyaW5naC5oOiBDIHNvdXJjZSwgQVNDSUkgdGV4dAoKU28g
dGhpcyBsb29rcyBsaWtlIGEgZmFsc2UgcG9zaXRpdmUgdG8gbWU/CgpUaGFua3MKCgo+Cj4gLS0t
Cj4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZSwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRw
czovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBsaXN0cy4wMS5vcmcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==

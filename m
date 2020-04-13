Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F61A61D4
	for <lists.virtualization@lfdr.de>; Mon, 13 Apr 2020 05:58:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F26885008;
	Mon, 13 Apr 2020 03:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcmJAu17NT-G; Mon, 13 Apr 2020 03:57:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0342B84E88;
	Mon, 13 Apr 2020 03:57:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E418FC0172;
	Mon, 13 Apr 2020 03:57:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B11AC0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 03:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 25ED384E88
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 03:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MDRoOPSQQA-r
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 03:57:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 40F7A84597
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586750274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6N50RfIS2nCxFimWzt9WF72+xwJQvZPe8nfXlTQ11ak=;
 b=htorcfDPth6FL8HzeDImEy0Hy8Ho2mBEekvEuszT2F8xmx1++jepy6PRbWBNuS8Fvrtl5v
 W66wRzV4h0CSx4VKRn35RSgcjAzPaBoRzW/t2kwqA0US8CCs3M8MaMlDNezYEM7DoObI8v
 fWpS5woy8ZeBKnMXVQMoWgGEZJK5dH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-9CvYkBqvNYWoIq_BU-OEfg-1; Sun, 12 Apr 2020 23:57:52 -0400
X-MC-Unique: 9CvYkBqvNYWoIq_BU-OEfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C5E68017F3;
 Mon, 13 Apr 2020 03:57:51 +0000 (UTC)
Received: from [10.72.13.79] (ovpn-13-79.pek2.redhat.com [10.72.13.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D35497AE9;
 Mon, 13 Apr 2020 03:57:46 +0000 (UTC)
Subject: Re: [PATCH v2] vdpa: make vhost, virtio depend on menu
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200412125018.74964-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <1ccf929a-99fc-55ad-3613-146186399c2c@redhat.com>
Date: Mon, 13 Apr 2020 11:57:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200412125018.74964-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvNC8xMiDkuIvljYg4OjUwLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gSWYg
dXNlciBkaWQgbm90IGNvbmZpZ3VyZSBhbnkgdmRwYSBkcml2ZXJzLCBuZWl0aGVyIHZob3N0Cj4g
bm9yIHZpcnRpbyB2ZHBhIGFyZSBnb2luZyB0byBiZSB1c2VmdWwuIFNvIHRoZXJlJ3Mgbm8gcG9p
bnQKPiBpbiBwcm9tcHRpbmcgZm9yIHRoZXNlIGFuZCBzZWxlY3RpbmcgdmRwYSBjb3JlIGF1dG9t
YXRpY2FsbHkuCj4gU2ltcGxpZnkgY29uZmlndXJhdGlvbiBieSBtYWtpbmcgdmlydGlvIGFuZCB2
aG9zdCB2ZHBhCj4gZHJpdmVycyBkZXBlbmQgb24gdmRwYSBtZW51IGVudHJ5LiBPbmNlIGRvbmUs
IHdlIG5vIGxvbmdlcgo+IG5lZWQgYSBzZXBhcmF0ZSBtZW51IGVudHJ5LCBzbyBhbHNvIGdldCBy
aWQgb2YgdGhpcy4KPiBXaGlsZSBhdCBpdCwgZml4IHVwIHRoZSBJRkMgZW50cnk6IFZEUEEtPnZE
UEEgZm9yIGNvbnNpc3RlbmN5Cj4gd2l0aCBvdGhlciBwbGFjZXMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgoKCkFja2VkLWJ5OiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKCj4gLS0tCj4KPiBjaGFuZ2VzIGZyb20gdjE6Cj4g
CWZpeCB1cCB2aXJ0aW8gdmRwYSBLY29uZmlnCj4KPiAgIGRyaXZlcnMvdmRwYS9LY29uZmlnICAg
fCAxNiArKysrKy0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL3Zob3N0L0tjb25maWcgIHwgIDIgKy0K
PiAgIGRyaXZlcnMvdmlydGlvL0tjb25maWcgfCAgMiArLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmRwYS9LY29uZmlnIGIvZHJpdmVycy92ZHBhL0tjb25maWcKPiBpbmRleCBkMGNiMGU1ODNhNWQu
LjcxZDlhNjRmMmM3ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvS2NvbmZpZwo+ICsrKyBi
L2RyaXZlcnMvdmRwYS9LY29uZmlnCj4gQEAgLTEsMjEgKzEsMTYgQEAKPiAgICMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+IC1jb25maWcgVkRQQQo+IC0JdHJpc3RhdGUK
PiArbWVudWNvbmZpZyBWRFBBCj4gKwl0cmlzdGF0ZSAidkRQQSBkcml2ZXJzIgo+ICAgCWhlbHAK
PiAgIAkgIEVuYWJsZSB0aGlzIG1vZHVsZSB0byBzdXBwb3J0IHZEUEEgZGV2aWNlIHRoYXQgdXNl
cyBhCj4gICAJICBkYXRhcGF0aCB3aGljaCBjb21wbGllcyB3aXRoIHZpcnRpbyBzcGVjaWZpY2F0
aW9ucyB3aXRoCj4gICAJICB2ZW5kb3Igc3BlY2lmaWMgY29udHJvbCBwYXRoLgo+ICAgCj4gLW1l
bnVjb25maWcgVkRQQV9NRU5VCj4gLQlib29sICJWRFBBIGRyaXZlcnMiCj4gLQlkZWZhdWx0IG4K
PiAtCj4gLWlmIFZEUEFfTUVOVQo+ICtpZiBWRFBBCj4gICAKPiAgIGNvbmZpZyBWRFBBX1NJTQo+
ICAgCXRyaXN0YXRlICJ2RFBBIGRldmljZSBzaW11bGF0b3IiCj4gICAJZGVwZW5kcyBvbiBSVU5U
SU1FX1RFU1RJTkdfTUVOVSAmJiBIQVNfRE1BCj4gLQlzZWxlY3QgVkRQQQo+ICAgCXNlbGVjdCBW
SE9TVF9SSU5HCj4gICAJc2VsZWN0IFZIT1NUX0lPVExCCj4gICAJZGVmYXVsdCBuCj4gQEAgLTI1
LDkgKzIwLDggQEAgY29uZmlnIFZEUEFfU0lNCj4gICAJICBkZXZlbG9wbWVudCBvZiB2RFBBLgo+
ICAgCj4gICBjb25maWcgSUZDVkYKPiAtCXRyaXN0YXRlICJJbnRlbCBJRkMgVkYgVkRQQSBkcml2
ZXIiCj4gKwl0cmlzdGF0ZSAiSW50ZWwgSUZDIFZGIHZEUEEgZHJpdmVyIgo+ICAgCWRlcGVuZHMg
b24gUENJX01TSQo+IC0Jc2VsZWN0IFZEUEEKPiAgIAlkZWZhdWx0IG4KPiAgIAloZWxwCj4gICAJ
ICBUaGlzIGtlcm5lbCBtb2R1bGUgY2FuIGRyaXZlIEludGVsIElGQyBWRiBOSUMgdG8gb2ZmbG9h
ZAo+IEBAIC0zNSw0ICsyOSw0IEBAIGNvbmZpZyBJRkNWRgo+ICAgCSAgVG8gY29tcGlsZSB0aGlz
IGRyaXZlciBhcyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlIG1vZHVsZSB3aWxsCj4gICAJ
ICBiZSBjYWxsZWQgaWZjdmYuCj4gICAKPiAtZW5kaWYgIyBWRFBBX01FTlUKPiArZW5kaWYgIyBW
RFBBCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZyBiL2RyaXZlcnMvdmhvc3Qv
S2NvbmZpZwo+IGluZGV4IGNiNmIxNzMyM2ViMi4uZTc5Y2JiZGZlYTQ1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IEBA
IC02NCw3ICs2NCw3IEBAIGNvbmZpZyBWSE9TVF9WRFBBCj4gICAJdHJpc3RhdGUgIlZob3N0IGRy
aXZlciBmb3IgdkRQQS1iYXNlZCBiYWNrZW5kIgo+ICAgCWRlcGVuZHMgb24gRVZFTlRGRAo+ICAg
CXNlbGVjdCBWSE9TVAo+IC0Jc2VsZWN0IFZEUEEKPiArCWRlcGVuZHMgb24gVkRQQQo+ICAgCWhl
bHAKPiAgIAkgIFRoaXMga2VybmVsIG1vZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qga2VybmVs
IHRvIGFjY2VsZXJhdGUKPiAgIAkgIGd1ZXN0IHZpcnRpbyBkZXZpY2VzIHdpdGggdGhlIHZEUEEt
YmFzZWQgYmFja2VuZHMuCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlydGlvL0tjb25maWcgYi9k
cml2ZXJzL3ZpcnRpby9LY29uZmlnCj4gaW5kZXggMmFhZGYzOThkOGNjLi4zOTVjM2Y0ZDQ5Y2Ig
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aXJ0aW8vS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmly
dGlvL0tjb25maWcKPiBAQCAtNDUsNyArNDUsNyBAQCBjb25maWcgVklSVElPX1BDSV9MRUdBQ1kK
PiAgIAo+ICAgY29uZmlnIFZJUlRJT19WRFBBCj4gICAJdHJpc3RhdGUgInZEUEEgZHJpdmVyIGZv
ciB2aXJ0aW8gZGV2aWNlcyIKPiAtCXNlbGVjdCBWRFBBCj4gKwlkZXBlbmRzIG9uIFZEUEEKPiAg
IAlzZWxlY3QgVklSVElPCj4gICAJaGVscAo+ICAgCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgc3Vw
cG9ydCBmb3IgdmlydGlvIGJhc2VkIHBhcmF2aXJ0dWFsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

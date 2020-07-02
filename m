Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFA1212E65
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 23:01:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 580B1870B5;
	Thu,  2 Jul 2020 21:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1p-sYU8ZQxF; Thu,  2 Jul 2020 21:01:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3B4E87088;
	Thu,  2 Jul 2020 21:01:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A616EC0733;
	Thu,  2 Jul 2020 21:01:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1810C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 21:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4DD4E2043A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 21:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p+s8+DQwvIQx
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 21:01:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 2139B20438
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 21:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593723673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qmj46YtkbL+I9zTq7ntIIfxROQfpX1hCxEUSvoiv0+I=;
 b=CY6ZNsp2fqeFzt6+2MPlc3aNQZbQVC5cvUnHoOkZo3w3QVk34TOZalPFnA+r6oIXwjVHeF
 5oPFyM4t2Eqa1TE/aKKTmnR4bqXpj20+beqj4vsXAcoAmPVzNl2wPvdAHPHiDh/FASCsav
 EGtwiyDbPvdo0iDIbtcU6MjAKftOrdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-mkvppFasMUC-xIraJrAEgA-1; Thu, 02 Jul 2020 17:01:09 -0400
X-MC-Unique: mkvppFasMUC-xIraJrAEgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17FAA107ACF7;
 Thu,  2 Jul 2020 21:01:08 +0000 (UTC)
Received: from llong.remote.csb (ovpn-118-66.rdu2.redhat.com [10.10.118.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9FBE77899;
 Thu,  2 Jul 2020 21:01:06 +0000 (UTC)
Subject: Re: [PATCH 6/8] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-7-npiggin@gmail.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <6b8ccb02-53ca-35d2-0dc6-2fc8e5523a97@redhat.com>
Date: Thu, 2 Jul 2020 17:01:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200702074839.1057733-7-npiggin@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

T24gNy8yLzIwIDM6NDggQU0sIE5pY2hvbGFzIFBpZ2dpbiB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5
OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgo+IC0tLQo+ICAgYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggICAgICAgICAgIHwgMjMgKysrKysrKysKPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9xc3BpbmxvY2suaCAgICAgICAgICB8IDU1ICsrKysrKysr
KysrKysrKysrKysKPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9xc3BpbmxvY2tfcGFyYXZp
cnQuaCB8ICA1ICsrCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJpZXMvS2NvbmZpZyAg
ICAgICAgfCAgNSArKwo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3NldHVwLmMg
ICAgICAgIHwgIDYgKy0KPiAgIGluY2x1ZGUvYXNtLWdlbmVyaWMvcXNwaW5sb2NrLmggICAgICAg
ICAgICAgICB8ICAyICsKPiAgIDYgZmlsZXMgY2hhbmdlZCwgOTUgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9xc3BpbmxvY2tfcGFyYXZpcnQuaAo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wYXJhdmlydC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgK
PiBpbmRleCA3YTg1NDY2NjBhNjMuLjVmYWU5ZGZhNmZlOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vcGFyYXZpcnQuaAo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9wYXJhdmlydC5oCj4gQEAgLTI5LDYgKzI5LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB5
aWVsZF90b19wcmVlbXB0ZWQoaW50IGNwdSwgdTMyIHlpZWxkX2NvdW50KQo+ICAgewo+ICAgCXBs
cGFyX2hjYWxsX25vcmV0cyhIX0NPTkZFUiwgZ2V0X2hhcmRfc21wX3Byb2Nlc3Nvcl9pZChjcHUp
LCB5aWVsZF9jb3VudCk7Cj4gICB9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJvZF9jcHUo
aW50IGNwdSkKPiArewo+ICsJcGxwYXJfaGNhbGxfbm9yZXRzKEhfUFJPRCwgZ2V0X2hhcmRfc21w
X3Byb2Nlc3Nvcl9pZChjcHUpKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHlpZWxk
X3RvX2FueSh2b2lkKQo+ICt7Cj4gKwlwbHBhcl9oY2FsbF9ub3JldHMoSF9DT05GRVIsIC0xLCAw
KTsKPiArfQo+ICAgI2Vsc2UKPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19zaGFyZWRfcHJvY2Vz
c29yKHZvaWQpCj4gICB7Cj4gQEAgLTQ1LDYgKzU1LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB5
aWVsZF90b19wcmVlbXB0ZWQoaW50IGNwdSwgdTMyIHlpZWxkX2NvdW50KQo+ICAgewo+ICAgCV9f
X2JhZF95aWVsZF90b19wcmVlbXB0ZWQoKTsgLyogVGhpcyB3b3VsZCBiZSBhIGJ1ZyAqLwo+ICAg
fQo+ICsKPiArZXh0ZXJuIHZvaWQgX19fYmFkX3lpZWxkX3RvX2FueSh2b2lkKTsKPiArc3RhdGlj
IGlubGluZSB2b2lkIHlpZWxkX3RvX2FueSh2b2lkKQo+ICt7Cj4gKwlfX19iYWRfeWllbGRfdG9f
YW55KCk7IC8qIFRoaXMgd291bGQgYmUgYSBidWcgKi8KPiArfQo+ICsKPiArZXh0ZXJuIHZvaWQg
X19fYmFkX3Byb2RfY3B1KHZvaWQpOwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJvZF9jcHUoaW50
IGNwdSkKPiArewo+ICsJX19fYmFkX3Byb2RfY3B1KCk7IC8qIFRoaXMgd291bGQgYmUgYSBidWcg
Ki8KPiArfQo+ICsKPiAgICNlbmRpZgo+ICAgCj4gICAjZGVmaW5lIHZjcHVfaXNfcHJlZW1wdGVk
IHZjcHVfaXNfcHJlZW1wdGVkCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9xc3BpbmxvY2suaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9xc3BpbmxvY2suaAo+IGlu
ZGV4IGY4NGRhNzdiNmJiNy4uOTk3YTlhMzJkZjc3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9xc3BpbmxvY2suaAo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9xc3BpbmxvY2suaAo+IEBAIC0zLDkgKzMsMzYgQEAKPiAgICNkZWZpbmUgX0FTTV9QT1dFUlBD
X1FTUElOTE9DS19ICj4gICAKPiAgICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9xc3BpbmxvY2tfdHlw
ZXMuaD4KPiArI2luY2x1ZGUgPGFzbS9wYXJhdmlydC5oPgo+ICAgCj4gICAjZGVmaW5lIF9RX1BF
TkRJTkdfTE9PUFMJKDEgPDwgOSkgLyogbm90IHR1bmVkICovCj4gICAKPiArI2lmZGVmIENPTkZJ
R19QQVJBVklSVF9TUElOTE9DS1MKPiArZXh0ZXJuIHZvaWQgbmF0aXZlX3F1ZXVlZF9zcGluX2xv
Y2tfc2xvd3BhdGgoc3RydWN0IHFzcGlubG9jayAqbG9jaywgdTMyIHZhbCk7Cj4gK2V4dGVybiB2
b2lkIF9fcHZfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aChzdHJ1Y3QgcXNwaW5sb2NrICpsb2Nr
LCB1MzIgdmFsKTsKPiArCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBxdWV1ZWRfc3Bp
bl9sb2NrX3Nsb3dwYXRoKHN0cnVjdCBxc3BpbmxvY2sgKmxvY2ssIHUzMiB2YWwpCj4gK3sKPiAr
CWlmICghaXNfc2hhcmVkX3Byb2Nlc3NvcigpKQo+ICsJCW5hdGl2ZV9xdWV1ZWRfc3Bpbl9sb2Nr
X3Nsb3dwYXRoKGxvY2ssIHZhbCk7Cj4gKwllbHNlCj4gKwkJX19wdl9xdWV1ZWRfc3Bpbl9sb2Nr
X3Nsb3dwYXRoKGxvY2ssIHZhbCk7Cj4gK30KCllvdSBtYXkgbmVlZCB0byBtYXRjaCB0aGUgdXNl
IG9mIF9fcHZfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aCgpIHdpdGggCnRoZSBjb3JyZXNwb25k
aW5nIF9fcHZfcXVldWVkX3NwaW5fdW5sb2NrKCksIGUuZy4KCiNkZWZpbmUgcXVldWVkX3NwaW5f
dW5sb2NrIHF1ZXVlZF9zcGluX3VubG9jawpzdGF0aWMgaW5saW5lIHF1ZXVlZF9zcGluX3VubG9j
ayhzdHJ1Y3QgcXNwaW5sb2NrICpsb2NrKQp7CiDCoMKgwqDCoMKgwqDCoCBpZiAoIWlzX3NoYXJl
ZF9wcm9jZXNzb3IoKSkKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbXBfc3RvcmVf
cmVsZWFzZSgmbG9jay0+bG9ja2VkLCAwKTsKIMKgwqDCoMKgwqDCoMKgIGVsc2UKIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3B2X3F1ZXVlZF9zcGluX3VubG9jayhsb2NrKTsKfQoK
T3RoZXJ3aXNlLCBwdl9raWNrKCkgd2lsbCBuZXZlciBiZSBjYWxsZWQuCgpDaGVlcnMsCkxvbmdt
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==

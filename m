Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9D21507E
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 02:30:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0E5888C92;
	Mon,  6 Jul 2020 00:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdziaE53eIrt; Mon,  6 Jul 2020 00:30:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA30F88C09;
	Mon,  6 Jul 2020 00:30:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A140FC016F;
	Mon,  6 Jul 2020 00:30:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AA4EC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 00:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7A1CB88B62
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 00:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Dn1dzN6ZIWZ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 00:30:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0D5988AD3
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 00:30:11 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id s14so14646218plq.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jul 2020 17:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=SiLUZ4upHaLyrogPRVRHW5icqN9xUKW8UG99tlD0o1w=;
 b=ZChIgkEh86/XjbL568B54v/+xUqg8dRxDHfP0F2txCazr/ay2G0gwdJ8PQfDaOYadl
 RSBC7AxSAzzk+5hNHcDCmTEf87pIkaz9EdJiV1gBnhrpwODw1O8kNb+gIWfEZib6R/nv
 3EBIhvq3HVyNAEtEpgNNV/sU5imC6rVyAYWyIuNC0TshQKJK7xOW0Nal4bQcIfLuW4E7
 xs/i78gs7bVGourp3tbhKRy66izcSw5q4f+joq28W1GbjqFSVVLQpuW66DMg1Eg6bcG1
 8i5+R2ZYW++2vXO4ov6gCxPcQDVxqLw0wYVi6qNiWXxB4MacdGFgBV+2F+WkPs13xaWm
 g2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=SiLUZ4upHaLyrogPRVRHW5icqN9xUKW8UG99tlD0o1w=;
 b=myHZNl6UoITM7ofGBD+Sid4Jh9MEjxH4UJHjEBRny02Cp4PhG9Bs4cPHwwfolCPyC+
 SS/m8MmHoGYcbUR1I7dbzsB9FRloGElcZRPHuAi5wJeqWfSeREVMJgzuO8k3OmPD+BPM
 l+4WBQWN6OHbC0jgMN9/AFoS6Kn2OPISstp+3YTENJQtB/Ll/YTagTa00NyjnIUuIRrG
 SnDRejBHEep376FuvmCOxH86cAtiqVIBnB8dMVNL3w7keeWYfZAxmWiUsqYf1nSB78PH
 QKO8cK/ohREEFdUqSuF7KkLhwHPim4ApfRX7qGExmwpAx90hrukTIE6yRF7AmXY2Sabb
 pOeQ==
X-Gm-Message-State: AOAM530jh1GW5Nsjb1VH5lWl4/glFO1UDXqT7LDzFyVdOADNd8mK1gCI
 awCyxs7ShiIP1th58cyMMPM=
X-Google-Smtp-Source: ABdhPJyswqCW+lIyGMKfHWg+k/xcX0xp3O7ypSRKMWd1CxCr9iuV5ZKPGSUPZi+UcDnz9fiQ/+enbg==
X-Received: by 2002:a17:90a:89:: with SMTP id a9mr5354677pja.171.1593995411484; 
 Sun, 05 Jul 2020 17:30:11 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id x10sm17583932pfp.80.2020.07.05.17.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 17:30:10 -0700 (PDT)
Date: Mon, 06 Jul 2020 10:30:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 5/6] powerpc/pseries: implement paravirt qspinlocks for
 SPLPAR
To: Waiman Long <longman@redhat.com>
References: <20200703073516.1354108-1-npiggin@gmail.com>
 <20200703073516.1354108-6-npiggin@gmail.com>
 <81d9981b-8a20-729c-b861-c7229e40bb65@redhat.com>
In-Reply-To: <81d9981b-8a20-729c-b861-c7229e40bb65@redhat.com>
MIME-Version: 1.0
Message-Id: <1593994632.syt8hwimv9.astroid@bobo.none>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RXhjZXJwdHMgZnJvbSBXYWltYW4gTG9uZydzIG1lc3NhZ2Ugb2YgSnVseSA2LCAyMDIwIDU6MDAg
YW06Cj4gT24gNy8zLzIwIDM6MzUgQU0sIE5pY2hvbGFzIFBpZ2dpbiB3cm90ZToKPj4gU2lnbmVk
LW9mZi1ieTogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAg
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmggICAgICAgICAgIHwgMjggKysrKysr
KysrKwo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9xc3BpbmxvY2suaCAgICAgICAgICB8
IDU1ICsrKysrKysrKysrKysrKysrKysKPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcXNw
aW5sb2NrX3BhcmF2aXJ0LmggfCAgNSArKwo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNl
cmllcy9LY29uZmlnICAgICAgICB8ICA1ICsrCj4+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
c2VyaWVzL3NldHVwLmMgICAgICAgIHwgIDYgKy0KPj4gICBpbmNsdWRlL2FzbS1nZW5lcmljL3Fz
cGlubG9jay5oICAgICAgICAgICAgICAgfCAgMiArCj4+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxMDAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vcXNwaW5sb2NrX3BhcmF2aXJ0LmgKPj4KPj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYXJhdmlydC5oIGIvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL3BhcmF2aXJ0LmgKPj4gaW5kZXggN2E4NTQ2NjYwYTYzLi5mMmQ1MWY5MjljZjUg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYXJhdmlydC5oCj4+ICsr
KyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wYXJhdmlydC5oCj4+IEBAIC0yOSw2ICsyOSwx
NiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgeWllbGRfdG9fcHJlZW1wdGVkKGludCBjcHUsIHUzMiB5
aWVsZF9jb3VudCkKPj4gICB7Cj4+ICAgCXBscGFyX2hjYWxsX25vcmV0cyhIX0NPTkZFUiwgZ2V0
X2hhcmRfc21wX3Byb2Nlc3Nvcl9pZChjcHUpLCB5aWVsZF9jb3VudCk7Cj4+ICAgfQo+PiArCj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJvZF9jcHUoaW50IGNwdSkKPj4gK3sKPj4gKwlwbHBhcl9o
Y2FsbF9ub3JldHMoSF9QUk9ELCBnZXRfaGFyZF9zbXBfcHJvY2Vzc29yX2lkKGNwdSkpOwo+PiAr
fQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgeWllbGRfdG9fYW55KHZvaWQpCj4+ICt7Cj4+
ICsJcGxwYXJfaGNhbGxfbm9yZXRzKEhfQ09ORkVSLCAtMSwgMCk7Cj4+ICt9Cj4+ICAgI2Vsc2UK
Pj4gICBzdGF0aWMgaW5saW5lIGJvb2wgaXNfc2hhcmVkX3Byb2Nlc3Nvcih2b2lkKQo+PiAgIHsK
Pj4gQEAgLTQ1LDYgKzU1LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB5aWVsZF90b19wcmVlbXB0
ZWQoaW50IGNwdSwgdTMyIHlpZWxkX2NvdW50KQo+PiAgIHsKPj4gICAJX19fYmFkX3lpZWxkX3Rv
X3ByZWVtcHRlZCgpOyAvKiBUaGlzIHdvdWxkIGJlIGEgYnVnICovCj4+ICAgfQo+PiArCj4+ICtl
eHRlcm4gdm9pZCBfX19iYWRfeWllbGRfdG9fYW55KHZvaWQpOwo+PiArc3RhdGljIGlubGluZSB2
b2lkIHlpZWxkX3RvX2FueSh2b2lkKQo+PiArewo+PiArCV9fX2JhZF95aWVsZF90b19hbnkoKTsg
LyogVGhpcyB3b3VsZCBiZSBhIGJ1ZyAqLwo+PiArfQo+PiArCj4+ICtleHRlcm4gdm9pZCBfX19i
YWRfcHJvZF9jcHUodm9pZCk7Cj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgcHJvZF9jcHUoaW50IGNw
dSkKPj4gK3sKPj4gKwlfX19iYWRfcHJvZF9jcHUoKTsgLyogVGhpcyB3b3VsZCBiZSBhIGJ1ZyAq
Lwo+PiArfQo+PiArCj4+ICAgI2VuZGlmCj4+ICAgCj4+ICAgI2RlZmluZSB2Y3B1X2lzX3ByZWVt
cHRlZCB2Y3B1X2lzX3ByZWVtcHRlZAo+PiBAQCAtNTcsNSArODAsMTAgQEAgc3RhdGljIGlubGlu
ZSBib29sIHZjcHVfaXNfcHJlZW1wdGVkKGludCBjcHUpCj4+ICAgCXJldHVybiBmYWxzZTsKPj4g
ICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHZfaXNfbmF0aXZlX3NwaW5fdW5sb2Nr
KHZvaWQpCj4+ICt7Cj4+ICsgICAgIHJldHVybiAhaXNfc2hhcmVkX3Byb2Nlc3NvcigpOwo+PiAr
fQo+PiArCj4+ICAgI2VuZGlmIC8qIF9fS0VSTkVMX18gKi8KPj4gICAjZW5kaWYgLyogX19BU01f
UEFSQVZJUlRfSCAqLwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Fz
cGlubG9jay5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3FzcGlubG9jay5oCj4+IGluZGV4
IGM0OWUzM2UyNGVkZC4uMDk2MGEwZGUyNDY3IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vcXNwaW5sb2NrLmgKPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3FzcGlubG9jay5oCj4+IEBAIC0zLDkgKzMsMzYgQEAKPj4gICAjZGVmaW5lIF9BU01fUE9XRVJQ
Q19RU1BJTkxPQ0tfSAo+PiAgIAo+PiAgICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9xc3BpbmxvY2tf
dHlwZXMuaD4KPj4gKyNpbmNsdWRlIDxhc20vcGFyYXZpcnQuaD4KPj4gICAKPj4gICAjZGVmaW5l
IF9RX1BFTkRJTkdfTE9PUFMJKDEgPDwgOSkgLyogbm90IHR1bmVkICovCj4+ICAgCj4+ICsjaWZk
ZWYgQ09ORklHX1BBUkFWSVJUX1NQSU5MT0NLUwo+PiArZXh0ZXJuIHZvaWQgbmF0aXZlX3F1ZXVl
ZF9zcGluX2xvY2tfc2xvd3BhdGgoc3RydWN0IHFzcGlubG9jayAqbG9jaywgdTMyIHZhbCk7Cj4+
ICtleHRlcm4gdm9pZCBfX3B2X3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgoc3RydWN0IHFzcGlu
bG9jayAqbG9jaywgdTMyIHZhbCk7Cj4+ICsKPj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCBxdWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKHN0cnVjdCBxc3BpbmxvY2sgKmxvY2ssIHUzMiB2
YWwpCj4+ICt7Cj4+ICsJaWYgKCFpc19zaGFyZWRfcHJvY2Vzc29yKCkpCj4+ICsJCW5hdGl2ZV9x
dWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKGxvY2ssIHZhbCk7Cj4+ICsJZWxzZQo+PiArCQlfX3B2
X3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgobG9jaywgdmFsKTsKPj4gK30KPiAKPiBJbiBhIHBy
ZXZpb3VzIG1haWwsIEkgc2FpZCB0aGF0OgoKSGV5LCB5ZWFoIEkgcmVhZCB0aGF0IHJpZ2h0IGFm
dGVyIHNlbmRpbmcgdGhlIHNlcmllcyBvdXQuIFRoYW5rcyBmb3IgdGhlIAp0aG9yb3VnaCByZXZp
ZXcuCgo+IFlvdSBtYXkgbmVlZCB0byBtYXRjaCB0aGUgdXNlIG9mIF9fcHZfcXVldWVkX3NwaW5f
bG9ja19zbG93cGF0aCgpIHdpdGggCj4gdGhlIGNvcnJlc3BvbmRpbmcgX19wdl9xdWV1ZWRfc3Bp
bl91bmxvY2soKSwgZS5nLgo+IAo+ICNkZWZpbmUgcXVldWVkX3NwaW5fdW5sb2NrIHF1ZXVlZF9z
cGluX3VubG9jawo+IHN0YXRpYyBpbmxpbmUgcXVldWVkX3NwaW5fdW5sb2NrKHN0cnVjdCBxc3Bp
bmxvY2sgKmxvY2spCj4gewo+ICDCoMKgwqDCoMKgwqDCoCBpZiAoIWlzX3NoYXJlZF9wcm9jZXNz
b3IoKSkKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtcF9zdG9yZV9yZWxlYXNl
KCZsb2NrLT5sb2NrZWQsIDApOwo+ICDCoMKgwqDCoMKgwqDCoCBlbHNlCj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBfX3B2X3F1ZXVlZF9zcGluX3VubG9jayhsb2NrKTsKPiB9Cj4g
Cj4gT3RoZXJ3aXNlLCBwdl9raWNrKCkgd2lsbCBuZXZlciBiZSBjYWxsZWQuCj4gCj4gTWF5YmUg
UG93ZXJQQyBITVQgaXMgZGlmZmVyZW50IHRoYXQgdGhlIHNoYXJlZCBjcHVzIGNhbiBzdGlsbCBw
cm9jZXNzIAo+IGluc3RydWN0aW9uLCB0aG91Z2ggc2xvd2VyLCB0aGF0IGNwdSBraWNraW5nIGxp
a2Ugd2hhdCB3YXMgZG9uZSBpbiBrdm0gCj4gaXMgbm90IHJlYWxseSBuZWNlc3NhcnkuIElmIHRo
YXQgaXMgdGhlIGNhc2UsIEkgdGhpbmsgd2Ugc2hvdWxkIGRvY3VtZW50IAo+IHRoYXQuCgpJdCBk
b2VzIHN0b3AgZGlzcGF0Y2gsIGJ1dCBpdCB3aWxsIHdha2UgdXAgYnkgaXRzZWxmIGFmdGVyIGFs
bCBvdGhlciAKdkNQVXMgaGF2ZSBoYWQgYSBjaGFuY2UgdG8gZGlzcGF0Y2guIEkgd2lsbCByZS10
ZXN0IHdpdGggdGhlIGZpeCBpbgpwbGFjZSBhbmQgc2VlIGlmIHRoZXJlJ3MgYW55IHNpZ25pZmlj
YW50IHBlcmZvcm1hbmNlIGRpZmZlcmVuY2VzLgoKVGhhbmtzLApOaWNrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

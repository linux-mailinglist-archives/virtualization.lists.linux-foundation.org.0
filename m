Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A46D15C46F
	for <lists.virtualization@lfdr.de>; Thu, 13 Feb 2020 16:53:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E5B482048E;
	Thu, 13 Feb 2020 15:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5AoiZTJO1Pf; Thu, 13 Feb 2020 15:53:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F10CF2034B;
	Thu, 13 Feb 2020 15:53:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E48EAC0177;
	Thu, 13 Feb 2020 15:53:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B181BC0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F83F2048E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXBKjHD449eH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 927372034B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581609215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3FkWdFXSGm8nRf/G4t6XQozUjKUXP7Krdr59zDr+Cjw=;
 b=gBl+ut21WhW/bOBDWFonkIWdQiR9tv0EcGB7BBNxiOCUCJ/NDnWAuLscPYpBLOIWwXlhEI
 Ja16R4LyqmEBaH32ZpiUlRfj+f3efkck9bYDp1A3/JozkTZW9HhVjgRXcgtZe9g0qkiR8v
 uO1RhELPAkapUE9BB4p370yc0WnkOR4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-SVd5Dw82MC6tCa81hn3ccQ-1; Thu, 13 Feb 2020 10:53:33 -0500
Received: by mail-qv1-f71.google.com with SMTP id n11so3758552qvp.15
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 Feb 2020 07:53:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3FkWdFXSGm8nRf/G4t6XQozUjKUXP7Krdr59zDr+Cjw=;
 b=CdHd0973cyD68aXIXzQN6DzwYoyrHUjn1RtuuHzGiKfa+6094g09WFqnNdsc8kfGsf
 YIUexXI7f8eLoDQDiYRzu1AFg0Z0TfLBmiE4POZXdNnPkb07mpQzyG9h/8xQrtG/8spL
 ax2QVk0UBL/GjV9KNWJO0vjUGCpNoVNVM4K02J6otoQKxcVq86X7V/czz0tV/0iriOoU
 85DiabCQNe6OxDcjYktFou0qW5EkS9oYMEpgoqC/r9kknrLQ3YWkZa+9CCUuwmKijPUQ
 GTe5cLJvAf3quA0MujUGe8edPmGbijxbpfcCg2YtkRI97ImdJykn6cRp9pEQfOGXwpg7
 Q8mA==
X-Gm-Message-State: APjAAAXRPLxQE5VLH5VgFMYHtUmdZ+xX/t4o/razkF0mHOw9Y9XJ5hol
 gcPGx0+neVFNigqVoWXdadm0U6Yk4K6esATts1GjKyyCZmlQIsXt34tXayFTROJzpSbskt58IIW
 dfyKcBPtGsgfQgU5sNkbXXmryDCxixMBIPwsTXBj+yg==
X-Received: by 2002:ae9:e88e:: with SMTP id a136mr172037qkg.71.1581609210919; 
 Thu, 13 Feb 2020 07:53:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxik+NUrSDUNwyo9OGo5sO0s3wLTjJedNNG8mgbQZB+akZZDVEf2GTRfMcPb1EYKXHzYpEcoQ==
X-Received: by 2002:ae9:e88e:: with SMTP id a136mr172018qkg.71.1581609210635; 
 Thu, 13 Feb 2020 07:53:30 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 l6sm1651426qti.10.2020.02.13.07.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:53:29 -0800 (PST)
Date: Thu, 13 Feb 2020 10:53:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200213105010-mutt-send-email-mst@kernel.org>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
 <20200211053502-mutt-send-email-mst@kernel.org>
 <9547228b-aa93-f2b6-6fdc-8d33cde3716a@cambridgegreys.com>
 <20200213045937-mutt-send-email-mst@kernel.org>
 <94fb9656-99ee-a001-e428-9d76c3620e61@gmail.com>
MIME-Version: 1.0
In-Reply-To: <94fb9656-99ee-a001-e428-9d76c3620e61@gmail.com>
X-MC-Unique: SVd5Dw82MC6tCa81hn3ccQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-um@lists.infradead.org, Anton Ivanov <anton.ivanov@cambridgegreys.com>
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDc6NDQ6MDZBTSAtMDgwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IAo+IAo+IE9uIDIvMTMvMjAgMjowMCBBTSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gV2VkLCBGZWIgMTIsIDIwMjAgYXQgMDU6Mzg6MDlQTSArMDAwMCwgQW50b24gSXZh
bm92IHdyb3RlOgo+ID4+Cj4gPj4KPiA+PiBPbiAxMS8wMi8yMDIwIDEwOjM3LCBNaWNoYWVsIFMu
IFRzaXJraW4gd3JvdGU6Cj4gPj4+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDA3OjQyOjM3QU0g
KzAwMDAsIEFudG9uIEl2YW5vdiB3cm90ZToKPiA+Pj4+IE9uIDExLzAyLzIwMjAgMDI6NTEsIEph
c29uIFdhbmcgd3JvdGU6Cj4gPj4+Pj4KPiA+Pj4+PiBPbiAyMDIwLzIvMTEg5LiK5Y2IMTI6NTUs
IEFudG9uIEl2YW5vdiB3cm90ZToKPiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gT24gMDkvMTIv
MjAxOSAxMDo0OCwgYW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbSB3cm90ZToKPiA+Pj4+
Pj4+IEZyb206IEFudG9uIEl2YW5vdiA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4K
PiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBTb21lIG9mIHRoZSBmcmFtZXMgbWFya2VkIGFzIEdTTyB3aGlj
aCBhcnJpdmUgYXQKPiA+Pj4+Pj4+IHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiKCkgaGF2ZSBubyBH
U09fVFlQRSwgbm8KPiA+Pj4+Pj4+IGZyYWdtZW50cyAoZGF0YV9sZW4gPSAwKSBhbmQgbGVuZ3Ro
IHNpZ25pZmljYW50bHkgc2hvcnRlcgo+ID4+Pj4+Pj4gdGhhbiB0aGUgTVRVICg3NTIgaW4gbXkg
ZXhwZXJpbWVudHMpLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoaXMgaXMgb2JzZXJ2ZWQgb24gcmF3
IHNvY2tldHMgcmVhZGluZyBvZmYgdkV0aCBpbnRlcmZhY2VzCj4gPj4+Pj4+PiBpbiBhbGwgNC54
IGFuZCA1Lngga2VybmVscyBJIHRlc3RlZC4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBUaGVzZSBmcmFt
ZXMgYXJlIHJlcG9ydGVkIGFzIGludmFsaWQgd2hpbGUgdGhleSBhcmUgaW4gZmFjdAo+ID4+Pj4+
Pj4gZ3NvLWxlc3MgZnJhbWVzLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoaXMgcGF0Y2ggbWFya3Mg
dGhlIHZuZXQgaGVhZGVyIGFzIG5vLUdTTyBmb3IgdGhlbSBpbnN0ZWFkCj4gPj4+Pj4+PiBvZiBy
ZXBvcnRpbmcgaXQgYXMgaW52YWxpZC4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbnRvbiBJdmFub3YgPGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5jb20+Cj4gPj4+Pj4+
PiAtLS0KPiA+Pj4+Pj4+ICDCoCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDggKysrKysr
LS0KPiA+Pj4+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Zp
cnRpb19uZXQuaCBiL2luY2x1ZGUvbGludXgvdmlydGlvX25ldC5oCj4gPj4+Pj4+PiBpbmRleCAw
ZDFmZTkyOTdhYzYuLmQ5MGQ1Y2ZmMWI5YSAxMDA2NDQKPiA+Pj4+Pj4+IC0tLSBhL2luY2x1ZGUv
bGludXgvdmlydGlvX25ldC5oCj4gPj4+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19u
ZXQuaAo+ID4+Pj4+Pj4gQEAgLTExMiw4ICsxMTIsMTIgQEAgc3RhdGljIGlubGluZSBpbnQKPiA+
Pj4+Pj4+IHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiKGNvbnN0IHN0cnVjdCBza19idWZmICpza2Is
Cj4gPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSA9IFZJ
UlRJT19ORVRfSERSX0dTT19UQ1BWNDsKPiA+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZWxz
ZSBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BWNikKPiA+Pj4+Pj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RD
UFY2Owo+ID4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGVsc2UKPiA+Pj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ID4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVs
c2Ugewo+ID4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNrYi0+ZGF0YV9sZW4g
PT0gMCkKPiA+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29f
dHlwZSA9IFZJUlRJT19ORVRfSERSX0dTT19OT05FOwo+ID4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZWxzZQo+ID4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVJTlZBTDsKPiA+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4gPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChzaW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NPX1RDUF9FQ04pCj4g
Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGRyLT5nc29fdHlwZSB8PSBWSVJU
SU9fTkVUX0hEUl9HU09fRUNOOwo+ID4+Pj4+Pj4gIMKgwqDCoMKgwqAgfSBlbHNlCj4gPj4+Pj4+
Pgo+ID4+Pj4+Pgo+ID4+Pj4+PiBwaW5nLgo+ID4+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gRG8geW91
IG1lYW4gZ3NvX3NpemUgaXMgc2V0IGJ1dCBnc29fdHlwZSBpcyBub3Q/IExvb2tzIGxpa2UgYSBi
dWcKPiA+Pj4+PiBlbHNld2hlcmUuCj4gPj4+Pj4KPiA+Pj4+PiBUaGFua3MKPiA+Pj4+Pgo+ID4+
Pj4+Cj4gPj4+PiBZZXMuCj4gPj4+Pgo+ID4+Pj4gSSBjb3VsZCBub3QgdHJhY2UgaXQgd2hlcmUg
aXQgaXMgY29taW5nIGZyb20uCj4gPj4+Pgo+ID4+Pj4gSSBzZWUgaXQgd2hlbiBkb2luZyByZWN2
bW1zZyBvbiByYXcgc29ja2V0cyBpbiB0aGUgVU1MIHZlY3RvciBuZXR3b3JrCj4gPj4+PiBkcml2
ZXJzLgo+ID4+Pj4KPiA+Pj4KPiA+Pj4gSSB0aGluayB3ZSBuZWVkIHRvIGZpbmQgdGhlIGN1bHBy
aXQgYW5kIGZpeCBpdCB0aGVyZSwgbG90cyBvZiBvdGhlciB0aGluZ3MKPiA+Pj4gY2FuIGJyZWFr
IG90aGVyd2lzZS4KPiA+Pj4gSnVzdCBwcmludGluZyBvdXQgc2tiLT5kZXYtPm5hbWUgc2hvdWxk
IGRvIHRoZSB0cmljaywgbm8/Cj4gPj4KPiA+PiBUaGUgcHJpbnRrIGluIHZpcnRpb19uZXRfaGRy
X2Zyb21fc2tiIHNheXMgTlVMTC4KPiA+Pgo+ID4+IFRoYXQgaXMgcHJvYmFibHkgbm9ybWFsIGZv
ciBhIGxvY2FsbHkgb3JpZ2luYXRlZCBmcmFtZS4KPiA+Pgo+ID4+IEkgY2Fubm90IHJlcHJvZHVj
ZSB0aGlzIHdpdGggbmV0d29yayB0cmFmZmljIGJ5IHRoZSB3YXkgLSBpdCBoYXBwZW5zIG9ubHkg
aWYgdGhlIHRyYWZmaWMgaXMgbG9jYWxseSBvcmlnaW5hdGVkIG9uIHRoZSBob3N0Lgo+ID4+Cj4g
Pj4gQSwKPiA+IAo+ID4gT0sgc28gaXMgaXQgY29kZSBpbiBfX3RjcF90cmFuc21pdF9za2IgdGhh
dCBzZXRzIGdzb19zaXplIHRvIG5vbi1udWxsCj4gPiB3aGVuIGdzb190eXBlIGlzIDA/Cj4gPgo+
IAo+IENvcnJlY3Qgd2F5IHRvIGRldGVybWluZSBpZiBhIHBhY2tldCBpcyBhIGdzbyBvbmUgaXMg
YnkgbG9va2luZyBhdCBnc29fc2l6ZS4KPiBUaGVuIG9ubHkgaXQgaXMgbGVnYWwgbG9va2luZyBh
dCBnc29fdHlwZQo+IAo+IAo+IHN0YXRpYyBpbmxpbmUgYm9vbCBza2JfaXNfZ3NvKGNvbnN0IHN0
cnVjdCBza19idWZmICpza2IpCj4gewo+ICAgICByZXR1cm4gc2tiX3NoaW5mbyhza2IpLT5nc29f
c2l6ZTsKPiB9Cj4gCj4gLyogTm90ZTogU2hvdWxkIGJlIGNhbGxlZCBvbmx5IGlmIHNrYl9pc19n
c28oc2tiKSBpcyB0cnVlICovCj4gc3RhdGljIGlubGluZSBib29sIHNrYl9pc19nc29fdjYoY29u
c3Qgc3RydWN0IHNrX2J1ZmYgKnNrYikKPiAuLi4KPiAKPiAKPiBUaGVyZSBpcyBhYnNvbHV0ZWx5
IG5vIHJlbGF0aW9uIGJldHdlZW4gR1NPIGFuZCBza2ItPmRhdGFfbGVuLCBza2IgY2FuIGJlIGxp
bmVhcml6ZWQKPiBmb3IgdmFyaW91cyBvcnRob2dvbmFsIHJlYXNvbnMuCgpUaGUgcmVwb3J0ZWQg
cHJvYmxlbSBpcyB0aGF0IHZpcnRpbyBnZXRzIGEgcGFja2V0IHdoZXJlIGdzb19zaXplCmlzICEw
IGJ1dCBnc29fdHlwZSBpcyAwLgoKSXQgY3VycmVudGx5IGRyb3BzIHRoZXNlIG9uIHRoZSBhc3N1
bXB0aW9uIHRoYXQgaXQncyBzb21lIHR5cGUKb2YgYSBnc28gcGFja2V0IGl0IGRvZXMgbm90IGtu
b3cgaG93IHRvIGhhbmRsZS4KCgpTbyB5b3UgYXJlIHNheWluZyBpZiBza2JfaXNfZ3NvIHdlIGNh
biBzdGlsbCBoYXZlIGdzb190eXBlIHNldCB0byAwLAphbmQgdGhhdCdzIGFuIGV4cGVjdGVkIGNv
bmZpZ3VyYXRpb24/CgpTbyB0aGUgcGF0Y2ggc2hvdWxkIGp1c3QgYmU6CgoKLSAgICAgICAgaWYg
KHNrYl9pc19nc28oc2tiKSkgeworICAgICAgICBpZiAoc2tiX2lzX2dzbyhza2IpICYmIHNpbmZv
LT5nc29fdHlwZSkgewoKCgo/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556835E921
	for <lists.virtualization@lfdr.de>; Wed, 14 Apr 2021 00:41:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF49540EEF;
	Tue, 13 Apr 2021 22:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGRuNjAcYB4h; Tue, 13 Apr 2021 22:41:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A09D40EEC;
	Tue, 13 Apr 2021 22:41:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C016C000A;
	Tue, 13 Apr 2021 22:41:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C0FDC000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 22:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B35140154
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 22:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxir7Kg_1Y3y
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 22:41:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E22E340140
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 22:41:37 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 h19-20020a9d64130000b02902875a567768so6638562otl.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 15:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2wQW7Ir0V37N8aEpZSFC+UlR8nY6Um1rb/71MJ1Oce0=;
 b=iKmssD/eJapSXNm5fS65nXtlBLsOifF4OlJoxfLEiErVAggwzz2Vrp/gvsrjxN4SQK
 9sh6OX162tZpNKgD2IWjm+Xw1AiOero39JiIa2jn3FZvMOmPAOpqGjNHN2JaCt5C37DS
 gIkgs+jDdsAf4QdP0lIHa3dImlE51iU88JjGYovO8dGWCct6l7jBtGxsDIHV1Jx+mjHa
 hXW7UgYdbz7i8hXwbozo+5gDd/4X2NGMVFU1Iyzsx1Sb1LAM430xW53V1c87myUFV9ob
 VY3CY0Oi42cSJmQGZE77zrneNTdPxcf2D0iu98yc8vknMUlszDoyPQoqkDzz/PHvO2HT
 qwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2wQW7Ir0V37N8aEpZSFC+UlR8nY6Um1rb/71MJ1Oce0=;
 b=XiY7vcZQkJ/JSmkINSeiHNK7kQ6NQNr2BWQi0wi7fiQIvJ/hNni4ZU0NvmAFN4s/vx
 t+suVTMaBPJcAgkCgSDlVTej0nLqU07PEr1gSk8XAz31UYD/Of4liAUPFHu9YA43H/Rg
 hGp8SNPLGpFhDkCAHz2zZrq0Pf31F86RwwVjXp8w4HlP/otFi9jIrEVreHi3/X+JbOo5
 5lI/lRJ/ZJ72Dv3f8BraryN1MGBwFU3pSUM9rbs8clrX0J2uNvmJKrU8WUtzgT/W6qT6
 B7a4fy0q89n32faohhxeei+aOIPJGFo+wMSWhj3X60WVQkcvQen4y/H26ZUL47IZXJ6i
 d8HA==
X-Gm-Message-State: AOAM530hBZJpANNKhzF74so83f5LQ8jyYc5D+l9DQt4PT8uGXS4AoLa0
 4t5HeJk6k2NkD8T0T7ZWi0wBWmtSGs8qqsBKYEt2hQ==
X-Google-Smtp-Source: ABdhPJx3grn25dA54vJd+We6mIK3WpGQiGK+itq3HIOrbObCPrGTxQfsIUv52S6uyRphIk4dusA6WeyiikzI/ct6+38=
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr29423176otk.279.1618353696942; 
 Tue, 13 Apr 2021 15:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210406183112.1150657-1-jiang.wang@bytedance.com>
 <1D46A084-5B77-4803-8B5F-B2F36541DA10@vmware.com>
 <CAP_N_Z-KFUYZc7p1z_-9nb9CvjtyGFkgkX1PEbh-SgKbX_snQw@mail.gmail.com>
 <20210412140437.6k3zxw2cv4p54lvm@steredhat>
 <CAP_N_Z9yi96YDW3gJdCFrPJpNhwpJnaT8gruk7JJSsBne8J-8Q@mail.gmail.com>
 <2EE65DBC-30AC-4E11-BFD5-73586B94C985@vmware.com>
 <20210413125231.k4qtyayp5eoiyxln@steredhat>
In-Reply-To: <20210413125231.k4qtyayp5eoiyxln@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Tue, 13 Apr 2021 15:41:26 -0700
Message-ID: <CAP_N_Z9uOeEjw1ZCkqrpKRhiMC1KXdooG0X-oQ_wpcJiiX3_mg@mail.gmail.com>
Subject: Re: Re: [RFC] vsock: add multiple transports support for dgram
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "cong.wang@bytedance.com" <cong.wang@bytedance.com>,
 "duanxiongchun@bytedance.com" <duanxiongchun@bytedance.com>,
 Andra Paraschiv <andraprs@amazon.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "xieyongji@bytedance.com" <xieyongji@bytedance.com>,
 Norbert Slusarek <nslusarek@gmx.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>,
 Alexander Popov <alex.popov@linux.com>
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

SGkgSm9yZ2VuLAoKVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24gYW5kIEkgYWdy
ZWUgd2l0aCB5b3UuIEZvciB0aGUgYmluZCBsaXN0LApteSAgcHJvdG90eXBlIGlzIGRvaW5nCnNv
bWV0aGluZyBzaW1pbGFyIHRvIHRoYXQuIEkgd2lsbCBkb3VibGUgY2hlY2sgaXQuCgpIaSBTdGVm
YW5vLAoKSSBkb24ndCBoYXZlIG90aGVyIHF1ZXN0aW9ucyBmb3Igbm93LiBUaGFua3MuCgpSZWdh
cmRzLAoKSmlhbmcKCk9uIFR1ZSwgQXByIDEzLCAyMDIxIGF0IDU6NTIgQU0gU3RlZmFubyBHYXJ6
YXJlbGxhIDxzZ2FyemFyZUByZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDEzLCAy
MDIxIGF0IDEyOjEyOjUwUE0gKzAwMDAsIEpvcmdlbiBIYW5zZW4gd3JvdGU6Cj4gPgo+ID4KPiA+
T24gMTIgQXByIDIwMjEsIGF0IDIwOjUzLCBKaWFuZyBXYW5nIC4gPGppYW5nLndhbmdAYnl0ZWRh
bmNlLmNvbTxtYWlsdG86amlhbmcud2FuZ0BieXRlZGFuY2UuY29tPj4gd3JvdGU6Cj4gPgo+ID5P
biBNb24sIEFwciAxMiwgMjAyMSBhdCA3OjA0IEFNIFN0ZWZhbm8gR2FyemFyZWxsYSA8c2dhcnph
cmVAcmVkaGF0LmNvbTxtYWlsdG86c2dhcnphcmVAcmVkaGF0LmNvbT4+IHdyb3RlOgo+ID4KPiA+
SGkgSmlhbmcsCj4gPnRoYW5rcyBmb3IgcmUtc3RhcnRpbmcgdGhlIG11bHRpLXRyYW5zcG9ydCBz
dXBwb3J0IGZvciBkZ3JhbSEKPiA+Cj4gPk5vIHByb2JsZW0uCj4gPgo+ID5PbiBXZWQsIEFwciAw
NywgMjAyMSBhdCAxMToyNTozNkFNIC0wNzAwLCBKaWFuZyBXYW5nIC4gd3JvdGU6Cj4gPk9uIFdl
ZCwgQXByIDcsIDIwMjEgYXQgMjo1MSBBTSBKb3JnZW4gSGFuc2VuIDxqaGFuc2VuQHZtd2FyZS5j
b208bWFpbHRvOmpoYW5zZW5Adm13YXJlLmNvbT4+IHdyb3RlOgo+ID4KPiA+Cj4gPk9uIDYgQXBy
IDIwMjEsIGF0IDIwOjMxLCBKaWFuZyBXYW5nIDxqaWFuZy53YW5nQGJ5dGVkYW5jZS5jb208bWFp
bHRvOmppYW5nLndhbmdAYnl0ZWRhbmNlLmNvbT4+IHdyb3RlOgo+ID4KPiA+RnJvbTogImppYW5n
Lndhbmc8aHR0cDovL2ppYW5nLndhbmc+IiA8amlhbmcud2FuZ0BieXRlZGFuY2UuY29tPG1haWx0
bzpqaWFuZy53YW5nQGJ5dGVkYW5jZS5jb20+Pgo+ID4KPiA+Q3VycmVudGx5LCBvbmx5IFZNQ0kg
c3VwcG9ydHMgZGdyYW0gc29ja2V0cy4gVG8gc3VwcG9ydGVkCj4gPm5lc3RlZCBWTSB1c2UgY2Fz
ZSwgdGhpcyBwYXRjaCByZW1vdmVzIHRyYW5zcG9ydF9kZ3JhbSBhbmQKPiA+dXNlcyB0cmFuc3Bv
cnRfZzJoIGFuZCB0cmFuc3BvcnRfaDJnIGZvciBkZ3JhbSB0b28uCj4gPgo+ID5JIGFncmVlIG9u
IHRoaXMgcGFydCwgSSB0aGluayB0aGF0J3MgdGhlIGRpcmVjdGlvbiB0byBnby4KPiA+dHJhbnNw
b3J0X2RncmFtIHdhcyBhZGRlZCBhcyBhIHNob3J0Y3V0Lgo+ID4KPiA+R290IGl0Lgo+ID4KPiA+
Cj4gPkNvdWxkIHlvdSBwcm92aWRlIHNvbWUgYmFja2dyb3VuZCBmb3IgaW50cm9kdWNpbmcgdGhp
cyBjaGFuZ2UgLSBhcmUgeW91Cj4gPmxvb2tpbmcgYXQgaW50cm9kdWNpbmcgZGF0YWdyYW1zIGZv
ciBhIGRpZmZlcmVudCB0cmFuc3BvcnQ/IFZNQ0kgZGF0YWdyYW1zCj4gPmFscmVhZHkgc3VwcG9y
dCB0aGUgbmVzdGVkIHVzZSBjYXNlLAo+ID4KPiA+WWVzLCBJIGFtIHRyeWluZyB0byBpbnRyb2R1
Y2UgZGF0YWdyYW0gZm9yIHZpcnRpbyB0cmFuc3BvcnQuIEkgd3JvdGUgYQo+ID5zcGVjIHBhdGNo
IGZvcgo+ID52aXJ0aW8gZGdyYW0gc3VwcG9ydCBhbmQgYWxzbyBhIGNvZGUgcGF0Y2gsIGJ1dCB0
aGUgY29kZSBwYXRjaCBpcyBzdGlsbCBXSVAuCj4gPldoZW4gSSB3cm90ZSB0aGlzIGNvbW1pdCBt
ZXNzYWdlLCBJIHdhcyB0aGlua2luZyBuZXN0ZWQgVk0gaXMgdGhlIHNhbWUgYXMKPiA+bXVsdGlw
bGUgdHJhbnNwb3J0IHN1cHBvcnQuIEJ1dCBub3csIEkgcmVhbGl6ZSB0aGV5IGFyZSBkaWZmZXJl
bnQuCj4gPk5lc3RlZCBWTXMgbWF5IHVzZQo+ID50aGUgc2FtZSB2aXJ0dWFsaXphdGlvbiBsYXll
cihLVk0gb24gS1ZNKSwgb3IgZGlmZmVyZW50IHZpcnR1YWxpemF0aW9uIGxheWVycwo+ID4oS1ZN
IG9uIEVTWGkpLiBUaGFua3MgZm9yIGxldHRpbmcgbWUga25vdyB0aGF0IFZNQ0kgYWxyZWFkeSBz
dXBwb3J0ZWQgbmVzdGVkCj4gPnVzZSBjYXNlcy4gSSB0aGluayB5b3UgbWVhbiBWTUNJIG9uIFZN
Q0ksIHJpZ2h0Pwo+ID4KPiA+YnV0IGlmIHdlIG5lZWQgdG8gc3VwcG9ydCBtdWx0aXBsZSBkYXRh
Z3JhbQo+ID50cmFuc3BvcnRzIHdlIG5lZWQgdG8gcmV3b3JrIGhvdyB3ZSBhZG1pbmlzdGVyIHBv
cnQgYXNzaWdubWVudCBmb3IgZGF0YWdyYW1zLgo+ID5PbmUgc3BlY2lmaWMgaXNzdWUgaXMgdGhh
dCB0aGUgdm1jaSB0cmFuc3BvcnQgd29u4oCZdCByZWNlaXZlIGFueSBkYXRhZ3JhbXMgZm9yIGEK
PiA+cG9ydCB1bmxlc3MgdGhlIGRhdGFncmFtIHNvY2tldCBoYXMgYWxyZWFkeSBiZWVuIGFzc2ln
bmVkIHRoZSB2bWNpIHRyYW5zcG9ydAo+ID5hbmQgdGhlIHBvcnQgYm91bmQgdG8gdGhlIHVuZGVy
bHlpbmcgVk1DSSBkZXZpY2UgKHNlZSBiZWxvdyBmb3IgbW9yZSBkZXRhaWxzKS4KPiA+Cj4gPkkg
c2VlLgo+ID4KPiA+VGhlIHRyYW5zcG9ydCBpcyBhc3NnaW5lZCB3aGVuIHNlbmRpbmcgZXZlcnkg
cGFja2V0IGFuZAo+ID5yZWNlaXZpbmcgZXZlcnkgcGFja2V0IG9uIGRncmFtIHNvY2tldHMuCj4g
Pgo+ID5JcyB0aGUgaW50ZW50IHRoYXQgdGhlIHNhbWUgZGF0YWdyYW0gc29ja2V0IGNhbiBiZSB1
c2VkIGZvciBzZW5kaW5nIHBhY2tldHMgYm90aAo+ID5JbiB0aGUgaG9zdCB0byBndWVzdCwgYW5k
IHRoZSBndWVzdCB0byBkaXJlY3Rpb25zPwo+ID4KPiA+Tm9wZS4gT25lIGRhdGFncmFtIHNvY2tl
dCB3aWxsIG9ubHkgc2VuZCBwYWNrZXRzIHRvIG9uZSBkaXJlY3Rpb24sIGVpdGhlciB0byB0aGUK
PiA+aG9zdCBvciB0byB0aGUgZ3Vlc3QuIE15IGFib3ZlIGRlc2NyaXB0aW9uIGlzIHdyb25nLiBX
aGVuIHNlbmRpbmcgcGFja2V0cywgdGhlCj4gPnRyYW5zcG9ydCBpcyBhc3NpZ25lZCB3aXRoIHRo
ZSBmaXJzdCBwYWNrZXQgKHdpdGggYXV0b19iaW5kKS4KPiA+Cj4gPkknbSBub3Qgc3VyZSB0aGlz
IGlzIHJpZ2h0Lgo+ID5UaGUgYXV0b19iaW5kIG9uIHRoZSBmaXJzdCBwYWNrZXQgc2hvdWxkIG9u
bHkgYXNzaWduIGEgbG9jYWwgcG9ydCB0byB0aGUKPiA+c29ja2V0LCBidXQgZG9lcyBub3QgYWZm
ZWN0IHRoZSB0cmFuc3BvcnQgdG8gYmUgdXNlZC4KPiA+Cj4gPkEgdXNlciBjb3VsZCBzZW5kIG9u
ZSBwYWNrZXQgdG8gdGhlIG5lc3RlZCBndWVzdCBhbmQgYW5vdGhlciB0byB0aGUgaG9zdAo+ID51
c2luZyB0aGUgc2FtZSBzb2NrZXQsIG9yIGFtIEkgd3Jvbmc/Cj4gPgo+ID5PSy4gSSB0aGluayB5
b3UgYXJlIHJpZ2h0Lgo+ID4KPiA+Cj4gPlRoZSBwcm9ibGVtIGlzIHdoZW4gcmVjZWl2aW5nIHBh
Y2tldHMuIFRoZSBsaXN0ZW5lciBjYW4gYmluZCB0byB0aGUKPiA+Vk1BRERSX0NJRF9BTlkKPiA+
YWRkcmVzcy4gVGhlbiBpdCBpcyB1bmNsZWFyIHdoaWNoIHRyYW5zcG9ydCB3ZSBzaG91bGQgdXNl
LiBGb3Igc3RyZWFtCj4gPnNvY2tldHMsIHRoZXJlIHdpbGwgYmUgYSBuZXcgc29ja2V0IGZvciBl
YWNoIGNvbm5lY3Rpb24sIGFuZCB0cmFuc3BvcnQKPiA+Y2FuIGJlIGRlY2lkZWQKPiA+YXQgdGhh
dCB0aW1lLiBGb3IgZGF0YWdyYW0gc29ja2V0cywgSSBhbSBub3Qgc3VyZSBob3cgdG8gaGFuZGxl
IHRoYXQuCj4gPgo+ID55ZXMsIHRoaXMgSSB0aGluayBpcyB0aGUgbWFpbiBwcm9ibGVtLCBidXQg
bWF5YmUgdGhlIHNlbmRlciBvbmUgaXMgZXZlbgo+ID5tb3JlIGNvbXBsaWNhdGVkLgo+ID4KPiA+
TWF5YmUgd2Ugc2hvdWxkIHJlbW92ZSB0aGUgMToxIGFzc29jaWF0aW9uIHdlIGhhdmUgbm93IGJl
dHdlZW4gdnNrIGFuZAo+ID50cmFuc3BvcnQuCj4gPgo+ID5ZZXMsIEkgdGhvdWdodCBhYm91dCB0
aGF0IHRvby4gT25lIGlkZWEgaXMgdG8gZGVmaW5lIHR3byB0cmFuc3BvcnRzIGluIHZzay4KPiA+
Rm9yIHNlbmRpbmcgcGt0LCB3ZSBjYW4gcGljayB0aGUgcmlnaHQgdHJhbnNwb3J0IHdoZW4gd2Ug
Z2V0IHRoZSBwYWNrZXQsIGxpa2UKPiA+aW4gdmlydGlvX3RyYW5zcG9ydF9zZW5kX3BrdF9pbmZv
KCkuIEZvciByZWNlaXZpbmcgcGt0cywgd2UgaGF2ZSB0byBjaGVjawo+ID5hbmQgY2FsbCBib3Ro
Cj4gPnRyYW5zcG9ydHMgZGVxdWV1ZSBjYWxsYmFja3MgaWYgdGhlIGxvY2FsIGNpZCBpcyBDSURf
QU5ZLgo+ID4KPiA+QXQgbGVhc3QgZm9yIERHUkFNLCBmb3IgY29ubmVjdGVkIHNvY2tldHMgSSB0
aGluayB0aGUgYXNzb2NpYXRpb24gbWFrZXMKPiA+c2Vuc2UuCj4gPgo+ID5ZZWFoLiBGb3IgYSBj
b25uZWN0ZWQgc29ja2V0LCB3ZSB3aWxsIG9ubHkgdXNlIG9uZSB0cmFuc3BvcnQuCj4gPgo+ID5G
b3IgVk1DSSwgZG9lcyB0aGUgc2FtZSB0cmFuc3BvcnQgY2FuIGJlIHVzZWQgZm9yIGJvdGggcmVj
ZWl2aW5nIGZyb20KPiA+aG9zdCBhbmQgZnJvbQo+ID50aGUgZ3Vlc3Q/Cj4gPgo+ID5ZZXMsIHRo
ZXkncmUgcmVnaXN0ZXJlZCBhdCBkaWZmZXJlbnQgdGltZXMsIGJ1dCBpdCdzIHRoZSBzYW1lIHRy
YW5zcG9ydC4KPiA+Cj4gPgo+ID5Gb3IgdmlydGlvLCB0aGUgaDJnIGFuZCBnMmggdHJhbnNwb3J0
cyBhcmUgZGlmZmVyZW50LCwgc28gd2UgaGF2ZSB0bwo+ID5jaG9vc2UKPiA+b25lIG9mIHRoZW0u
IE15IG9yaWdpbmFsIHRob3VnaHQgaXMgdG8gd2FpdCB1bnRpbCB0aGUgZmlyc3QgcGFja2V0Cj4g
PmFycml2ZXMuCj4gPgo+ID5Bbm90aGVyIGlkZWEgaXMgdGhhdCB3ZSBhbHdheXMgYmluZCB0byBo
b3N0IGFkZHIgYW5kIHVzZSBoMmcKPiA+dHJhbnNwb3J0IGJlY2F1c2UgSSB0aGluayB0aGF0IG1p
Z2h0Cj4gPmJlIG1vcmUgY29tbW9uLiBJZiBhIGxpc3RlbmVyIHdhbnRzIHRvIHJlY3YgcGFja2V0
cyBmcm9tIHRoZSBob3N0LCB0aGVuCj4gPml0Cj4gPnNob3VsZCBiaW5kIHRvIHRoZSBndWVzdCBh
ZGRyIGluc3RlYWQgb2YgQ0lEX0FOWS4KPiA+Cj4gPlllcywgSSByZW1lbWJlciB3ZSBkaXNjdXNz
ZWQgdGhpcyBpZGVhLCB0aGlzIHdvdWxkIHNpbXBsaWZ5IHRoZQo+ID5yZWNlaXZpbmcsIGJ1dCB0
aGVyZSBpcyBzdGlsbCB0aGUgaXNzdWUgb2YgYSB1c2VyIHdhbnRpbmcgdG8gcmVjZWl2ZQo+ID5w
YWNrZXRzIGZyb20gYm90aCB0aGUgbmVzdGVkIGd1ZXN0IGFuZCB0aGUgaG9zdC4KPiA+Cj4gPk9L
LiBBZ3JlZS4KPiA+Cj4gPkFueSBvdGhlciBzdWdnZXN0aW9ucz8KPiA+Cj4gPgo+ID5JIHRoaW5r
IG9uZSBzb2x1dGlvbiBjb3VsZCBiZSB0byByZW1vdmUgdGhlIDE6MSBhc3NvY2lhdGlvbiBiZXR3
ZWVuCj4gPkRHUkFNIHNvY2tldCBhbmQgdHJhbnNwb3J0Lgo+ID4KPiA+SUlVQyBWTUNJIGNyZWF0
ZXMgYSBza2IgZm9yIGVhY2ggcmVjZWl2ZWQgcGFja2V0IGFuZCBxdWV1ZXMgaXQgdGhyb3VnaAo+
ID5za19yZWNlaXZlX3NrYigpIGRpcmVjdGx5IGluIHRoZSBzdHJ1Y3Qgc29jay4KPiA+Cj4gPlRo
ZW4gdGhlIC5kZ3JhbV9kZXF1ZXVlKCkgY2FsbGJhY2sgZGVxdWV1ZXMgdGhlbSB1c2luZwo+ID5z
a2JfcmVjdl9kYXRhZ3JhbSgpLgo+ID4KPiA+V2UgY2FuIG1vdmUgdGhlc2UgcGFydHMgaW4gdGhl
IHZzb2NrIGNvcmUsIGFuZCBjcmVhdGUgc29tZSBoZWxwZXJzIHRvCj4gPmFsbG93IHRoZSB0cmFu
c3BvcnRzIHRvIGVucXVldWUgcmVjZWl2ZWQgREdSQU0gcGFja2V0cyBpbiB0aGUgc2FtZSB3YXkK
PiA+KGFuZCB3aXRoIHRoZSBzYW1lIGZvcm1hdCkgZGlyZWN0bHkgaW4gdGhlIHN0cnVjdCBzb2Nr
Lgo+ID4KPiA+Cj4gPkkgYWdyZWUgdG8gdXNlIHNrYnMgKGFuZCBtb3ZlIHRoZW0gdG8gdnNjb2sg
Y29yZSkuIFdlIGhhdmUgYW5vdGhlciB1c2UgY2FzZQo+ID53aGljaCB3aWxsIG5lZWQgdG8gdXNl
IHNrYi4gQnV0IEkgYW0gbm90IHN1cmUgaG93IHRoaXMgaGVscHMgd2l0aCBtdWx0aXBsZQo+ID50
cmFuc3BvcnQgY2FzZXMuIEVhY2ggdHJhbnNwb3J0IGhhcyBhIGRncmFtX2RlcXVldWUgY2FsbGJh
Y2suIFNvIHdlIHN0aWxsCj4gPm5lZWQgdG8gbGV0IHZzayBoYXZlIG11bHRpcGxlIHRyYW5zcG9y
dHMgc29tZWhvdy4gQ291bGQgeW91IGVsYWJvcmF0ZSBob3cKPiA+dXNpbmcgc2tiIGhlbHAgd2l0
aCBtdWx0aXBsZSB0cmFuc3BvcnQgc3VwcG9ydD8gV2lsbCB0aGF0IGJlIHNpbWlsYXIgdG8gd2hh
dCBJCj4gPm1lbnRpb25lZCBhYm92ZT8gVGhhbmtzLgo+ID4KPiA+TW92aW5nIGF3YXkgZnJvbSB0
aGUgMToxIGFzc29jaWF0aW9uIGJldHdlZW4gREdSQU0gc29ja2V0IGFuZCB0cmFuc3BvcnRzIHNv
dW5kcwo+ID5saWtlIHRoZSByaWdodCBhcHByb2FjaCB0byBtZS4gQSBkZ3JhbSBzb2NrZXQgYm91
bmQgdG8gQ0lEX0FOWSB3b3VsZCBiZSBhYmxlIHRvCj4gPnVzZSBlaXRoZXIgaDJnIG9yIGcyaCBv
biBhIHBlciBkZ3JhbSBiYXNpcy4gSWYgdGhlIHNvY2tldCBpcyBib3VuZCB0byBhIHNwZWNpZmlj
IENJRCAtCj4gPmVpdGhlciBob3N0IG9yIHRoZSBndWVzdCBDSUQsIGl0IHNob3VsZCBvbmx5IHVz
ZSBlaXRoZXIgdGhlIGgyZyBmb3IgaG9zdCBDSUQgb3IgZzJoCj4gPmZvciB0aGUgZ3Vlc3QgQ0lE
LiBUaGlzIHdvdWxkIG1hdGNoIHRoZSBsb2dpYyBmb3IgdGhlIHN0cmVhbSBzb2NrZXRzLgo+ID4K
PiA+SSBsaWtlIHRoZSBpZGVhIG9mIHJlbW92aW5nIHRoZSBkZ3JhbV9kZXF1ZXVlIGNhbGxiYWNr
IGZyb20gdGhlIHRyYW5zcG9ydHMgYW5kIGluc3RlYWQKPiA+aGF2aW5nIGEgY2FsbCB0aGF0IGFs
bG93IHRoZSB0cmFuc3BvcnRzIHRvIGVucXVldWUgcmVjZWl2ZWQgZGdyYW1zIGludG8gdGhlIHNv
Y2tldAo+ID5yZWNlaXZlIHF1ZXVlIGFzIHNrYnMuIFRoaXMgaXMgd2hhdCB0aGUgVk1DSSB0cmFu
c3BvcnQgZG9lcyB0b2RheS4gVGhlbiB0aGUKPiA+dnNvY2tfZGdyYW1fcmVjdm1zZyBmdW5jdGlv
biB3aWxsIHByb3ZpZGUgZnVuY3Rpb25hbGl0eSBzaW1pbGFyIHRvIHdoYXQKPiA+dm1jaV90cmFu
c3BvcnRfZGdyYW1fZGVxdWV1ZSBkb2VzIHRvZGF5LiBUaGUgY3VycmVudCBkYXRhZ3JhbSBmb3Jt
YXQgdXNlZCB3YXMKPiA+Y3JlYXRlZCBzcGVjaWZpY2FsbHkgZm9yIFZNQ0kgZGF0YWdyYW1zLCBi
dXQgdGhlIGhlYWRlciBqdXN0IGNvbnRhaW5zIHNvdXJjZSBhbmQgZGVzdAo+ID5DSUQgYW5kIHBv
cnQsIHNvIHdlIHNob3VsZCBiZSBhYmxlIHRvIHVzZSBpdCBhcyBpcy4KPiA+Cj4gPkZvciBzZW5k
cyBmcm9tIENJRF9BTlksIHRoZSBzYW1lIGxvZ2ljIGFzIGZvciBzdHJlYW1zIGluIHZzb2NrX2Fz
c2lnbl90cmFuc3BvcnQgY2FuCj4gPmJlIGFwcGxpZWQgb24gZWFjaCBzZW5kIC0gYnV0IHdpdGhv
dXQgbG9ja2luZyB0aGUgZGdyYW0gc29ja2V0IHRvIGEgc3BlY2lmaWMgdHJhbnNwb3J0Lgo+ID4K
PiA+U28gdGhlIGFib3ZlIGlzIG1vc3RseSByZXN0YXRpbmcgd2hhdCBTdGVmYW5vIHByb3Bvc2Vk
LCBzbyB0aGlzIHdhcyBhIHZlcmJvc2Ugd2F5Cj4gPm9mIGFncmVlaW5nIHdpdGggdGhhdC4KPgo+
IEpvcmdlbiwgdGhhbmsgeW91IHZlcnkgbXVjaCEKPiBUaGlzIGlzIGV4YWN0bHkgd2hhdCBJIGhh
ZCBpbiBtaW5kLCBleHBsYWluZWQgbXVjaCBiZXR0ZXIgOi0pCj4KPiBXZSBzaG91bGQgbG9vayBh
dCB0aGUgZGF0YWdyYW0gaGVhZGVyIGJldHRlciBiZWNhdXNlIHZpcnRpby12c29jayB1c2VzCj4g
NjQgYml0cyBmb3IgQ0lEIGFuZCBwb3J0LCBidXQgSSBkb24ndCB0aGluayBpdCdzIGEgYmlnIHBy
b2JsZW0uCj4KPiBASmlhbmcsIEkgdGhpbmsgSm9yZ2VuIGFuc3dlcmVkIHlvdSBxdWVzdGlvbnMs
IGJ1dCBmZWVsIGZyZWUgdG8gYXNrIG1vcmUKPiBpZiBpdCdzIG5vdCBjbGVhci4KPgo+ID4KPiA+
V2l0aCByZXNwZWN0IHRvIGJpbmRpbmcgYSBkZ3JhbSBzb2NrZXQgdG8gYSBwb3J0LCB3ZSBjb3Vs
ZCBpbnRyb2R1Y2UgYSBib3VuZCBsaXN0IGZvcgo+ID5kZ3JhbSBzb2NrZXRzIGp1c3QgbGlrZSB3
ZSBoYXZlIGZvciBzdHJlYW1zLiBIb3dldmVyLCBmb3IgVk1DSSwgdGhlIHBvcnQgc3BhY2UKPiA+
aXMgc2hhcmVkIHdpdGggb3RoZXIgVk1DSSBkYXRhZ3JhbSBjbGllbnRzIChhdCB0aGUgVk1DSSBk
ZXZpY2UgbGV2ZWwpLCBzbyBpZiBhCj4gPmRncmFtIHNvY2tldCBjYW4gcG90ZW50aWFsbHkgdXNl
IHRoZSB2bWNpIHRyYW5zcG9ydCwgaXQgc2hvdWxkIHJlc2VydmUgdGhlIHBvcnQKPiA+d2l0aCB0
aGUgVk1DSSB0cmFuc3BvcnQgYmVmb3JlIGFzc2lnbmluZyBpdCB0byB0aGUgc29ja2V0LiBTbyBz
aW1pbGFyIHRvIGhvdwo+ID5fX3Zzb2NrX2JpbmRfc3RyZWFtIGNoZWNrcyBpZiBhbiBwb3J0IGlz
IGFscmVhZHkgYm91bmQvaW4gdXNlLCB0aGUgZGdyYW0gc29ja2V0Cj4gPndvdWxkIGhhdmUgYW4g
YWRkaXRpb25hbCBjYWxsIHRvIHBvdGVudGlhbCB0cmFuc3BvcnRzIHRvIHJlc2VydmUgdGhlIHBv
cnQuIElmIHRoZQo+ID5wb3J0IGNhbm5vdCBiZSByZXNlcnZlZCB3aXRoIHRoZSB0cmFuc3BvcnQs
IG1vdmUgb24gdG8gdGhlIG5leHQgcG9ydCBpbiB0aGUgY2FzZQo+ID5vZiBWTUFERFJfUE9SVF9B
TlksIG9yIHJldHVybiBFQUREUklOVVNFIG90aGVyd2lzZS4gT25jZSByZXNlcnZlZCwKPiA+SXQg
d2lsbCBlbnN1cmUgdGhhdCBWTUNJIGNhbiBkZWxpdmVyIGRhdGFncmFtcyB0byB0aGUgc3BlY2lm
aWVkIHBvcnQuIEEgcmVzZXJ2ZWQKPiA+cG9ydCBzaG91bGQgYmUgcmVsZWFzZWQgd2hlbiB0aGUg
c29ja2V0IGlzIHJlbW92ZWQgZnJvbSB0aGUgYm91bmQgbGlzdC4KPgo+IFllcywgSSBhZ3JlZSwg
aXQgc2VlbXMgdGhlIHJpZ2h0IHdheSB0byBnby4KPgo+IFRoYW5rcywKPiBTdGVmYW5vCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7956E5ECC
	for <lists.virtualization@lfdr.de>; Tue, 18 Apr 2023 12:31:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B84A81F22;
	Tue, 18 Apr 2023 10:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B84A81F22
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igel-co-jp.20221208.gappssmtp.com header.i=@igel-co-jp.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=wGWlYWS1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3PuvchqnAlZ2; Tue, 18 Apr 2023 10:31:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DBBAC81F2C;
	Tue, 18 Apr 2023 10:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBBAC81F2C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9277C0089;
	Tue, 18 Apr 2023 10:31:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37798C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 10:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 026AC406E0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 10:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 026AC406E0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igel-co-jp.20221208.gappssmtp.com
 header.i=@igel-co-jp.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=wGWlYWS1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qYNUt8Z25xHn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 10:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4564C40543
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4564C40543
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 10:31:19 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b52ad6311so2283068b3a.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 03:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20221208.gappssmtp.com; s=20221208; t=1681813879; x=1684405879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vTXdY5NuBVVPgEbeE3bHL/Qnxc0lVVP6ZRYfwYnz1ac=;
 b=wGWlYWS1etvSoTQUet4lObRX9RWt9eN7hVdv/B0GnhqYqwypMHz2jioeZxu0/wiV6t
 lhZKuhp7IZ8KKVFJO5Ja3u4uRmNoUk0UGqDcG7PJ+6dCJRvv3JC++wsDQZywXygCGg/a
 E/p4k+BU1gIUvsZddckIzwaqZQaJ3V8o1lakTKR6r5tqb5JbiqNQWaOPLZd/O0nSyfsT
 1wydQGBCAOgnyM56ehWnNoXysNPPeyEdENHgmXKoL10sb1jJ74f/ngXMwvsGpCN+uImT
 c0ur12HhIt0U+frEZzjkQ8qaqZhZavMOTiyHruP5cJe/E1EIJLk6EWJd1HEdNf5sk8gS
 hQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681813879; x=1684405879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vTXdY5NuBVVPgEbeE3bHL/Qnxc0lVVP6ZRYfwYnz1ac=;
 b=H5ebsBuw4/pFN9oJe54GnwQa7hRjRH2ShQ0ehdm1XZEJScGguqam3xsmpRBbG+uZGT
 IEvoyh/ogVBefmh2EcWUOwKeUvETrKTJbOSeOpHOrusYn7feOaHHOyPB2DTiMLjXrUHO
 ueg3lE2n5Bz4C4coEkdjMGKtsrZkOPek0OlJZVfA5DPnzGu/SkJVrVoP+xOTZ6HA7pna
 /ugYW7rc4UfA8TIN3d/zsZeAv0prSpvxHX5nls/XbidvBowa9DJW2fNM1OaEfUIx121j
 PZWCAlOqSjMoV2ZZtedYv2AmawUYAMU4ss07kmnGBoJco1wPnhCXjmi6Y37Ji8Em1Xmx
 2PKg==
X-Gm-Message-State: AAQBX9eYTSpIbMxWcocG1x8rzNo82EqQaEVd19NgHeDQ0A3sWn+zxacL
 IDhyu2Vmu7b6sB+0mMvfZXz/Ng==
X-Google-Smtp-Source: AKy350Zi63/seSKnnXtoC1hx5JGZfJDFrYlHZz7PvnC5IGwEnfPHrlVk3AwQkCWZmpadURE4ezzECw==
X-Received: by 2002:a05:6a00:ace:b0:63d:3c9d:2c9 with SMTP id
 c14-20020a056a000ace00b0063d3c9d02c9mr1425230pfl.3.1681813879315; 
 Tue, 18 Apr 2023 03:31:19 -0700 (PDT)
Received: from [10.16.161.199] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 f6-20020aa782c6000000b0062dbafced27sm9092959pfn.27.2023.04.18.03.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 03:31:18 -0700 (PDT)
Message-ID: <7680d6cd-163d-8648-33da-c3d7d2e2fa3d@igel.co.jp>
Date: Tue, 18 Apr 2023 19:31:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [EXT] [RFC PATCH 0/3] Introduce a PCIe endpoint virtio console
Content-Language: en-US
To: Frank Li <frank.li@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20230414123903.896914-1-mie@igel.co.jp>
 <AM6PR04MB483871ADC2BA657BBF3A5A4588999@AM6PR04MB4838.eurprd04.prod.outlook.com>
 <9e9acbf6-3486-56d3-c15a-c3d67557c2a9@igel.co.jp>
 <AM6PR04MB483893F2A017B54AE29474A9889C9@AM6PR04MB4838.eurprd04.prod.outlook.com>
From: Shunsuke Mie <mie@igel.co.jp>
In-Reply-To: <AM6PR04MB483893F2A017B54AE29474A9889C9@AM6PR04MB4838.eurprd04.prod.outlook.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Randy Dunlap <rdunlap@infradead.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Ren Zhijie <renzhijie2@huawei.com>, Jon Mason <jdmason@kudzu.us>,
 Bjorn Helgaas <bhelgaas@google.com>
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

Ck9uIDIwMjMvMDQvMTggMDoxOSwgRnJhbmsgTGkgd3JvdGU6Cj4KPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogU2h1bnN1a2UgTWllIDxtaWVAaWdlbC5jby5qcD4KPj4gU2Vu
dDogU3VuZGF5LCBBcHJpbCAxNiwgMjAyMyA5OjEyIFBNCj4+IFRvOiBGcmFuayBMaSA8ZnJhbmsu
bGlAbnhwLmNvbT47IExvcmVuem8gUGllcmFsaXNpIDxscGllcmFsaXNpQGtlcm5lbC5vcmc+Cj4+
IENjOiBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT47IE1hbml2YW5uYW4gU2Fk
aGFzaXZhbQo+PiA8bWFuaUBrZXJuZWwub3JnPjsgS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lz
aG9uQGtlcm5lbC5vcmc+OyBCam9ybgo+PiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPjsg
TWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT47Cj4+IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+OyBKb24gTWFzb24gPGpkbWFzb25Aa3VkenUudXM+Owo+PiBSYW5keSBE
dW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz47IFJlbiBaaGlqaWUKPj4gPHJlbnpoaWppZTJA
aHVhd2VpLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+PiBwY2lA
dmdlci5rZXJuZWwub3JnOyB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
Zwo+PiBTdWJqZWN0OiBSZTogW0VYVF0gW1JGQyBQQVRDSCAwLzNdIEludHJvZHVjZSBhIFBDSWUg
ZW5kcG9pbnQgdmlydGlvIGNvbnNvbGUKPj4KPj4gQ2F1dGlvbjogRVhUIEVtYWlsCj4+Cj4+IE9u
IDIwMjMvMDQvMTQgMjM6MzksIEZyYW5rIExpIHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+Pj4gRnJvbTogU2h1bnN1a2UgTWllIDxtaWVAaWdlbC5jby5qcD4KPj4+PiBT
ZW50OiBGcmlkYXksIEFwcmlsIDE0LCAyMDIzIDc6MzkgQU0KPj4+PiBUbzogTG9yZW56byBQaWVy
YWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KPj4+PiBDYzogS3J6eXN6dG9mIFdpbGN6ecWE
c2tpIDxrd0BsaW51eC5jb20+OyBNYW5pdmFubmFuIFNhZGhhc2l2YW0KPj4+PiA8bWFuaUBrZXJu
ZWwub3JnPjsgS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQGtlcm5lbC5vcmc+OyBCam9y
bgo+Pj4+IEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4g
PG1zdEByZWRoYXQuY29tPjsKPj4+PiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsg
U2h1bnN1a2UgTWllIDxtaWVAaWdlbC5jby5qcD47Cj4+Pj4gRnJhbmsgTGkgPGZyYW5rLmxpQG54
cC5jb20+OyBKb24gTWFzb24gPGpkbWFzb25Aa3VkenUudXM+OyBSYW5keQo+Pj4+IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPjsgUmVuIFpoaWppZSA8cmVuemhpamllMkBodWF3ZWkuY29t
PjsKPj4+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1wY2lAdmdlci5rZXJu
ZWwub3JnOwo+Pj4+IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCj4+
Pj4gU3ViamVjdDogW0VYVF0gW1JGQyBQQVRDSCAwLzNdIEludHJvZHVjZSBhIFBDSWUgZW5kcG9p
bnQgdmlydGlvIGNvbnNvbGUKPj4+Pgo+Pj4+IENhdXRpb246IEVYVCBFbWFpbAo+Pj4+Cj4+Pj4g
UENJZSBlbmRwb2ludCBmcmFtZXdvcmsgcHJvdmlkZXMgQVBJcyB0byBpbXBsZW1lbnQgUENJZSBl
bmRwb2ludAo+Pj4+IGZ1bmN0aW9uLgo+Pj4+IFRoaXMgZnJhbWV3b3JrIGFsbG93cyBkZWZpbmlu
ZyB2YXJpb3VzIFBDSWUgZW5kcG9pbnQgZnVuY3Rpb24gYmVoYXZpb3JzCj4+IGluCj4+Pj4gc29m
dHdhcmUuIFRoaXMgcGF0Y2ggZXh0ZW5kIHRoZSBmcmFtZXdvcmsgZm9yIHZpcnRpbyBwY2kgZGV2
aWNlLiBUaGUKPj4+PiB2aXJ0aW8gaXMgZGVmaW5lZCB0byBjb21tdW5pY2F0ZSBndWVzdCBvbiB2
aXJ0dWFsIG1hY2hpbmUgYW5kIGhvc3Qgc2lkZS4KPj4+PiBBZHZhbnRhZ2Ugb2YgdGhlIHZpcnRp
byBpcyB0aGUgZWZmaWNpZW5jeSBvZiBkYXRhIHRyYW5zZmVyIGFuZCB0aGUKPj4gY29uY2lzZW5l
c3MKPj4+PiBvZiBpbXBsZW1lbnRhdGlvbiBkZXZpY2UgdXNpbmcgc29mdHdhcmUuIEl0IGFsc28g
YmUgYXBwbGllZCB0byBQQ0llCj4+Pj4gZW5kcG9pbnQgZnVuY3Rpb24uCj4+Pj4KPj4+PiBXZSBk
ZXNpZ25lZCBhbmQgaW1wbGVtZW50ZWQgYSBQQ0llIEVQIHZpcnRpbyBjb25zb2xlIGZ1bmN0aW9u
IGRyaXZlcgo+PiB1c2luZwo+Pj4+IHRoZSBleHRlbmRlZCBQQ0llIGVuZHBvaW50IGZyYW1ld29y
ayBmb3IgdmlydGlvLiBJdCBjYW4gYmUgY29tbXVuaWNhdGUKPj4+PiBob3N0IGFuZCBlbmRwb2lu
dCBvdmVyIHZpcnRpbyBhcyBjb25zb2xlLgo+Pj4+Cj4+Pj4gQW4gYXJjaGl0ZWN0dXJlIG9mIHRo
ZSBmdW5jdGlvbiBkcml2ZXIgaXMgZm9sbG93aW5nOgo+Pj4+Cj4+Pj4gICAg4pSM4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSACj4+IOKUgOKUgAo+Pj4+IOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUgOKUrOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUkAo+Pj4+ICAgIOKU
gnZpcnRpbyAgICAgIOKUgiAgICAgICAgIOKUgiAgICAgICAgICAgICAgICAgICAgICDilIJ2aXJ0
aW8gICAgICDilIIKPj4+PiAgICDilIJjb25zb2xlIGRydiDilIIgICAgICAgICDilJzilIDilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJAgICAgICDilIIKPj4gY29u
c29sZQo+Pj4+IGRydiDilIIKPj4+PiAgICDilJzilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilKQgICAgICAgICDilIIodmlydGlvIGNvbnNvbGXilIIgICAgICDilJzilIDilIDi
lIAKPj4g4pSA4pSACj4+Pj4g4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSkCj4+Pj4gICAg4pSCIHZp
cnRpbyBidXMg4pSCICAgICAgICAg4pSCIGRldmljZSkgICAgICAg4pSC4peE4pSA4pSA4pSA4pSA
4pa64pSCIHZpcnRpbyBidXMg4pSCCj4+Pj4gICAg4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSkICAgICAgICAg4pScLS0tLS0tLS0tLS0tLS0t4pSkICAgICAg4pSU4pSA
4pSA4pSA4pSACj4+IOKUgOKUgAo+Pj4+IOKUgOKUgOKUgOKUgOKUgOKUgOKUpAo+Pj4+ICAgIOKU
giAgICAgICAgICAgIOKUgiAgICAgICAgIOKUgiBwY2kgZXAgdmlydGlvIOKUgiAgICAgICAgICAg
ICAgICAgICDilIIKPj4+PiAgICDilIIgIHBjaSBidXMgICDilIIgICAgICAgICDilIIgIGNvbnNv
bGUgZHJ2ICDilIIgICAgICAgICAgICAgICAgICAg4pSCCj4+Pj4gICAg4pSCICAgICAgICAgICAg
4pSCICBwY2llICAg4pSc4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSkICAgICAgICAgICAgICAgICAgIOKUggo+Pj4+ICAgIOKUgiAgICAgICAgICAgIOKUgiDi
l4TilIDilIDilIDilIDilIDilrog4pSCICBwY2kgZXAgQnVzICAg4pSCICAgICAgICAgICAgICAg
ICAgIOKUggo+Pj4+ICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
mCAgICAgICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgAo+PiDilIDi
lIAKPj4+PiDilIDilLTilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilIDilIDilJgKPj4+PiAgICAgIFBDSWUgUm9vdCAgICAgICAgICAgICAgUENJZSBF
bmRwb2ludAo+Pj4+Cj4+PiBbRnJhbmsgTGldIFNvbWUgYmFzaWMgcXVlc3Rpb24sCj4+PiBJIHNl
ZSB5b3UgY2FsbCByZWdpc3Rlcl92aXJ0aW9fZGV2aWNlIGF0IGVwZl92Y29uX3NldHVwX3ZkZXYs
Cj4+PiBXaHkgY2FsbCBpdCBhcyB2aXJ0aW8gY29uc29sZT8gIEkgc3VwcG9zZSBpdCBzaG91bGQg
YmUgdmlydGlvYnVzIGRpcmVjdGx5Pwo+PiBJJ20gc29ycnkgSSBkaWRuJ3QgdW5kZXJzdGFuZCB5
b3VyIHF1ZXN0aW9uLiBXaGF0IGRvIHlvdSBtZWFuIHRoZQo+PiB2aXJ0aW9idXMgZGlyZWN0bHk/
Cj4gSSBnbyB0aHJvdWdoIHlvdXIgY29kZSBhZ2Fpbi4gIEkgdGhpbmsgSSB1bmRlcnN0YW5kIHdo
eSB5b3UgbmVlZCBwY2ktZXBmLXZjb24uYy4KPiBBY3R1YWxseSwgIG15IG1lYW5zIGlzIGxpa2Ug
dmlydGlvX21taW9fcHJvYmUuCj4KPiB2bV9kZXYtPnZkZXYuaWQuZGV2aWNlID0gcmVhZGwodm1f
ZGV2LT5iYXNlICsgVklSVElPX01NSU9fREVWSUNFX0lEKTsKPiB2bV9kZXYtPnZkZXYuaWQudmVu
ZG9yID0gcmVhZGwodm1fZGV2LT5iYXNlICsgVklSVElPX01NSU9fVkVORE9SX0lEKTsKPgo+IEkg
YW0gbm90IHN1cmUgdGhhdCBpZiBWSVJUSU9fTU1JT19WRU5ET1JfSUQgYW5kIFZJUlRJT19NTUlP
X0RFVklDRV9JRAo+IHJldXNlIFBDSSdzIHZlbmRvciBJRCBhbmQgRGV2aWNlIElELiAgSWYgeWVz
LCB5b3UgY2FuIGRpcmVjdGx5IGdldCBzdWNoIGluZm9ybWF0aW9uCj4gZnJvbSBlcGYuICBJZiBu
bywgIGEgY3VzdG9tZXIgZmllbGQgY2FuIGJlZW4gYWRkZWQgYXQgZXBmIGRyaXZlci4KPgo+IFNv
IHlvdSBuZWVkbid0IHdyaXRlIHBjaS1lcGYtdmNvbiAgYW5kIHBjaS1lcGYtdm5ldCAuLi4uLgo+
Cj4gT2YgY2F1c2UgaXQgd2lsbCBiZSB3b25kZXJmdWwgaWYgZGlyZWN0bHkgdXNlIHZpcnRpb19t
bWlvX3Byb2JlIGJ5IGR5bm1hdGljIGNyZWF0ZSBwbGF0Zm9ybQo+IERldmljZXMuICBJdCBtYXkg
aGF2ZSBzb21lIGRpZmZpY3VsdCBiZWNhdXNlIHBjaSBtZW1vcnkgbWFwIHJlcXVpcmVtZW50LgpJ
IHRoaW5rIHRoYXQgc29tZSBmaWVsZHMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRoZSB2ZGV2IGFuZCBl
cGYgZGV2aWNlLgpIb3dldmVyLCB3ZSBuZWVkIHRvIGltcGxlbWVudCBkZXZpY2UgZW11bGF0aW9u
IGJlY2F1c2UgZWFjaCB2aXJ0aW8gZGV2aWNlCmhhcyBpdHMgc3BlY2lmaWMgc2V0IG9mIHRhc2tz
LiBGb3IgZXhhbXBsZSwgdGhlIHZpcnRpby1uZXQgZGV2aWNlIGhhcyBhCmNvbnRyb2wgcXVldWUs
IGFuZCB0aGUgZHJpdmVyIGNhbiByZXF1ZXN0IE1BQyBmaWx0ZXJzLCBWTEFOcywgYW5kIG90aGVy
CnNldHRpbmdzIHZpYSB0aGlzIHF1ZXVlLiBUaGVzZSByZXF1ZXN0cyBoYXZlIHRvIGJlIHByb2Nl
c3NlZCBieSB0aGUgdmlydGlvCmRldmljZSB0aGF0IHdlIGFyZSBpbXBsZW1lbnRpbmcgaW4gcGNp
LWVwZi12bmV0LgoKVGhlIHNpbXBsZXN0IHZpcnRpby1jb25zb2xlIGRldmljZSBkb2VzbuKAmXQg
aGF2ZSB0aGVzZSB0YXNrcywgYnV0IHRoZSBvdGhlcgp2aXJ0aW8gZGV2aWNlcyByZXF1aXJlcHJv
Y2Vzc2luZyB0aGVtLgoKVGhhdCdzIHdoeSB0aGUgY3VycmVudCBwY2ktZXBmLXZpcnRpbyBkZXNp
Z24gcmVxdWlyZXMgYSBzcGVjaWZpYwppbXBsZW1lbnRhdGlvbiBmb3IgZWFjaCB2aXJ0aW8gZGV2
aWNlLgoKSXMgdGhpcyB3aGF0IHlvdSBtZWFudD8KCj4KPj4+IFByZXZpb3VzIHlvdSB1c2Ugdmly
dGlvLW5ldCwgd2h5IGNoYW5nZSB0byB2aXJ0aW8tY29uc29sZSBoZXJlPyAgRG9lcyBpdAo+PiBt
YXR0ZXI/Cj4+Cj4+IE5vLCBpdCBkb2Vzbid0LiBKdXN0IEknZCBsaWtlIHRvIGJyZWFrIGRvd24g
dGhlIGNoYW5nZXMgaW50byBzbWFsbGVyCj4+IHN0ZXBzIHRvIG1ha2UgaXQgZWFzaWVyIHRvIHJl
dmlldyBhbmQgbWVyZ2UgdGhlIGNoYW5nZXMuCj4+Cj4+IEFzIGEgZmlyc3Qgc3RlcCwgSSBwcm9w
b3NlIGFkZGluZyBhIHNpbXBsZXN0IHZpcnRpbyBmdW5jdGlvbiBkcml2ZXIgd2l0aAo+PiB0aGUg
ZXh0ZW5zaW9uIGRlZmluZWQgaW4gcGNpLWVwZi12aXJ0aW8ue2gsY30uCj4+Cj4+PiBBbGwgdmly
dGlvLVhYWCBzaG91bGQgd29yaz8KPj4gWWVzLCB0aGUgZXh0ZW5zaW9uIGlzIGRlc2lnbmVkIHRv
IHVzZSBhbnkgdHlwZSBvZiB2aXJ0aW8gZGV2aWNlLgo+Pj4gWW91IHJlbW92ZWQgRURNQSBzdXBw
b3J0IHRoaXMgdmVyc2lvbj8KPj4gSSBwbGFuZWQgdGhlIHN1cHBvcnQgd2lsbCBiZSBhZGRlZCB3
aXRoIGVwZiB2aXJ0aW8tbmV0IHBhdGNoZXMuCj4+Pj4gSW50cm9kdWNlZCBkcml2ZXIgaXMgYHBj
aSBlcCB2aXJ0aW8gY29uc29sZSBkcnZgIGluIHRoZSBmaWd1cmUuIEl0IHdvcmtzCj4+Pj4gYXMg
ZXAgZnVuY3Rpb24gZm9yIFBDSWUgcm9vdCBhbmQgdmlydHVhbCB2aXJ0aW8gY29uc29sZSBkZXZp
Y2UgZm9yIFBDSWUKPj4+PiBlbmRwb2ludC4gRWFjaCBzaWRlIG9mIHZpcnRpbyBjb25zb2xlIGRy
aXZlciBoYXMgdmlydHF1ZXVlLCBhbmQKPj4+PiBpbnRyb2R1Y2VkIGRyaXZlciB0cmFuc2ZlcnMg
ZGF0YSBvbiB0aGUgdmlydHF1ZXVlIHRvIGVhY2ggb3RoZXIuIEEgZGF0YQo+Pj4+IG9uIHJvb3Qg
dHggcXVldWUgaXMgdHJhbnNmZXJlZCB0byBlbmRwb2ludCByeCBxdWV1ZSBhbmQgdmljZSB2ZXJz
YS4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2hzZXQgaXMgZGVwZW5kIGZvbGx3aW5nIHBhdGNoZXMgd2hp
Y2ggYXJlIHVuZGVyIGRpc2N1c3Npb24uCj4+Pj4KPj4+PiAtIFtSRkMgUEFUQ0ggMC8zXSBEZWFs
IHdpdGggYWxpZ25tZW50IHJlc3RyaWN0aW9uIG9uIEVQIHNpZGUKPj4+PiBsaW5rOgo+Pj4+Cj4+
IGh0dHBzOi8vbG9yZS5rLwo+PiAlMkYmZGF0YT0wNSU3QzAxJTdDZnJhbmsubGklNDBueHAuY29t
JTdDZmY1OWExNmY4OGM2NDM5MTNlMzkwOGRiMwo+PiBlZTkxY2E4JTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzODE3Mjk0MzE1Cj4+IDM4MjE4MzElN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYKPj4gMmx1TXpJ
aUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9aFRC
Cj4+IDVVRGFKb0pmdGE5b2hNRyUyQnJ4Q1ZKWTM0QU5uMTBpU0xQOWlDSFgzTSUzRCZyZXNlcnZl
ZD0wCj4+Pj4gZXJuZWwub3JnJTJGbGludXgtcGNpJTJGMjAyMzAxMTMwOTAzNTAuMTEwMzQ5NC0x
LQo+Pj4+Cj4+IG1pZSU0MGlnZWwuY28uanAlMkYmZGF0YT0wNSU3QzAxJTdDRnJhbmsuTGklNDBu
eHAuY29tJTdDZWE2NTEzZGJmCj4+IDQwODRiODBjZWQyMDhkYjNjZTU0MTMzJTdDNjg2ZWExZDNi
YzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTcKPj4gQzAlN0M2MzgxNzA3Mjc1NTg4MDA3MjAl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3Cj4+IExqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MKPj4+PiAlN0Ml
N0Mmc2RhdGE9allneSUyQnhrODRaWFpSVmZxbTBHQ1hvUm5DVExNclg0elRmViUyQnM1TW0KPj4g
c3ZvCj4+Pj4gJTNEJnJlc2VydmVkPTAKPj4+PiAtIFtSRkMgUEFUQ0ggdjIgMC83XSBJbnRyb2R1
Y2UgYSB2cmluZ2ggYWNjZXNzb3IgZm9yIElPIG1lbW9yeQo+Pj4+IGxpbms6Cj4+Pj4KPj4gaHR0
cHM6Ly9sb3JlLmsvCj4+ICUyRiZkYXRhPTA1JTdDMDElN0NmcmFuay5saSU0MG54cC5jb20lN0Nm
ZjU5YTE2Zjg4YzY0MzkxM2UzOTA4ZGIzCj4+IGVlOTFjYTglN0M2ODZlYTFkM2JjMmI0YzZmYTky
Y2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM4MTcyOTQzMTUKPj4gMzgyMTgzMSU3Q1Vua25vd24l
N0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVgo+PiAybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1oVEIKPj4g
NVVEYUpvSmZ0YTlvaE1HJTJCcnhDVkpZMzRBTm4xMGlTTFA5aUNIWDNNJTNEJnJlc2VydmVkPTAK
Pj4+PiBlcm5lbC5vcmclMkZ2aXJ0dWFsaXphdGlvbiUyRjIwMjMwMjAyMDkwOTM0LjU0OTU1Ni0x
LQo+Pj4+Cj4+IG1pZSU0MGlnZWwuY28uanAlMkYmZGF0YT0wNSU3QzAxJTdDRnJhbmsuTGklNDBu
eHAuY29tJTdDZWE2NTEzZGJmCj4+IDQwODRiODBjZWQyMDhkYjNjZTU0MTMzJTdDNjg2ZWExZDNi
YzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTcKPj4gQzAlN0M2MzgxNzA3Mjc1NTg4MDA3MjAl
N0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3Cj4+IExqQXdNREFpTENKUUlqb2lW
Mmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwMDAlN0MKPj4+PiAlN0Ml
N0Mmc2RhdGE9SzRFbDc2R1NBR3RzV2tOQlhKSzUlMkZuN2ZsQ04yMGVFTVpwWllUWDJXSVowCj4+
ICUzCj4+Pj4gRCZyZXNlcnZlZD0wCj4+Pj4KPj4+PiBGaXJzdCBvZiB0aGlzIHBhdGNoc2V0IGlz
IGludHJvZHVjZSBhIGhlbHBlciBmdW5jdGlvbiB0byByZWFsaXplIHBjaQo+Pj4+IHZpcnRpbyBm
dW5jdGlvbiB1c2luZyBQQ0llIGVuZHBvaW50IGZyYW1ld29yay4gVGhlIHNlY29uZCBvbmUgaXMg
YWRkaW5nCj4+Pj4gYSBtaXNzaW5nIGRlZmluaXRpb24gZm9yIHZpcnRpbyBwY2kgaGVhZGVyLiBU
aGUgbGFzdCBvbmUgaXMgZm9yIFBDSWUKPj4+PiBlbmRwb2ludCB2aXJ0aW8gY29uc29sZSBkcml2
ZXIuCj4+Pj4KPj4+PiBUaGlzIGlzIHRlc3RlZCBvbiBsaW51eC0yMDIzMDQwNiBhbmQgUkNhciBT
NCBib2FyZCBhcyBQQ0llIGVuZHBvaW50Lgo+Pj4+Cj4+Pj4gU2h1bnN1a2UgTWllICgzKToKPj4+
PiAgICAgUENJOiBlbmRwb2ludDogaW50cm9kdWNlIGEgaGVscGVyIHRvIGltcGxlbWVudCBwY2kg
ZXAgdmlydGlvIGZ1bmN0aW9uCj4+Pj4gICAgIHZpcnRpb19wY2k6IGFkZCBhIGRlZmluaXRpb24g
b2YgcXVldWUgZmxhZyBpbiBJU1IKPj4+PiAgICAgUENJOiBlbmRwb2ludDogQWRkIEVQIGZ1bmN0
aW9uIGRyaXZlciB0byBwcm92aWRlIHZpcnRpby1jb25zb2xlCj4+Pj4gICAgICAgZnVuY3Rpb25h
bGl0eQo+Pj4+Cj4+Pj4gICAgZHJpdmVycy9wY2kvZW5kcG9pbnQvZnVuY3Rpb25zL0tjb25maWcg
ICAgICAgIHwgIDE5ICsKPj4+PiAgICBkcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvTWFr
ZWZpbGUgICAgICAgfCAgIDIgKwo+Pj4+ICAgIGRyaXZlcnMvcGNpL2VuZHBvaW50L2Z1bmN0aW9u
cy9wY2ktZXBmLXZjb24uYyB8IDU1NAo+PiArKysrKysrKysrKysrKysrKysKPj4+PiAgICAuLi4v
cGNpL2VuZHBvaW50L2Z1bmN0aW9ucy9wY2ktZXBmLXZpcnRpby5jICAgfCA0NjkgKysrKysrKysr
KysrKysrCj4+Pj4gICAgLi4uL3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvcGNpLWVwZi12aXJ0aW8u
aCAgIHwgMTIzICsrKysKPj4+PiAgICBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX3BjaS5oICAg
ICAgICAgICAgICAgfCAgIDMgKwo+Pj4+ICAgIDYgZmlsZXMgY2hhbmdlZCwgMTE3MCBpbnNlcnRp
b25zKCspCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGNpL2VuZHBvaW50L2Z1
bmN0aW9ucy9wY2ktZXBmLXZjb24uYwo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvcGNpLWVwZi12aXJ0aW8uYwo+Pj4+ICAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BjaS9lbmRwb2ludC9mdW5jdGlvbnMvcGNpLWVwZi12aXJ0aW8u
aAo+Pj4+Cj4+Pj4gLS0KPj4+PiAyLjI1LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u

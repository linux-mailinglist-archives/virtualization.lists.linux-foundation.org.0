Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8847D5667
	for <lists.virtualization@lfdr.de>; Tue, 24 Oct 2023 17:30:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D34FF4331C;
	Tue, 24 Oct 2023 15:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34FF4331C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=oRrVD3Mg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Y8rv-zC7iop; Tue, 24 Oct 2023 15:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3FEEB43318;
	Tue, 24 Oct 2023 15:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FEEB43318
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58401C0DD3;
	Tue, 24 Oct 2023 15:30:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4B52C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 15:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F84082C98
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 15:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F84082C98
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=oRrVD3Mg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDudDjA7u80V
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 15:30:09 +0000 (UTC)
Received: from sonic302-27.consmr.mail.ne1.yahoo.com
 (sonic302-27.consmr.mail.ne1.yahoo.com [66.163.186.153])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B49C816F5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Oct 2023 15:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B49C816F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698161408; bh=/YWm8GWX2383RfzFLFlBBduZ0aqXcPqlJQ3Z3PAB/jk=;
 h=Date:Subject:To:References:From:In-Reply-To:From:Subject:Reply-To;
 b=oRrVD3MghqUvCPNNVDqxY5gD7/iZWJ5beBwVmbM46N6KeIOs98QvthAVhKEqsIkclvk2wr1RXcfh1Gr3Q9EPSBj8NdS4zZGcW9UCm5m1ulk8NLBRrAIHp+CVVALv42qCeuxR5m5DS0HrmwFxH+tX60aoePLSiKoJ0LtvYlVA03XZ4WYcRC4WsA/A5zYl7N5CcjC3dHDXaeztY6QqgwVUiiclG33TY2ZpLFZZPr9ZW9UcSVGNeRHEEmKbpeOgAEqshiva/kMjcAduiUARZTkk+jHai9o3jSo8NunwUuun3vGLXJ9W+Kcv6LQsU9AzT0aMWiZEOnCGA3OC+8k+opl/KA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698161408; bh=CkIOfqZ9TC1VkyJ7eKh3XTtlD8DmK8bQcnLdZ7gE9j3=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=difXLLaq92rU/B3K+Bjmm2EFmg4IhMPFDeOBmICWrC4kLTaWJwpOmdJArLY/vgFDiaELYzA1wT6ByMn1aliB+dUL1vDBj/UgYwEbEiUr5WV8C9nt85x0TLFmAa1AoOy+TQpgngTEItfGFH+Uz2Ir+ASn4e09OoB7qsntaTkR1tpMNtf9j+2Ki4dyCU9u24ehTcEr9jonmsGS+XZaM0ZKvni/VuVTHxfEhiE45eVmjSgJ5pfa3l9I6YiEZWXZJbs9b8bAA78VatUKaZV7iuoLxvgIuNFFu+QFDPLGnpJkqB89Y0bqNSvpkUjNVcwvUS8TEruyVDdrz2JTKiEijrTFxg==
X-YMail-OSG: B4ESFpwVM1kBZ6lSz8rkkaXhskytnfYU40elwEwgBiLLQZujXONemP5xHi72sOt
 ai7ZWBC8CJCZVw8MUfjwqrM7kujN_pfUkWR6Zt67bdR01U2nvtGsfaVBSHrZ3316B7mYc_IWswMN
 ggHnj0tqoBGKOUm238BxaeXRIZIb7Y7remZYF16w4dTf3g00wwfa2o7bO3bJshxzTdIS3n9bnr.Y
 zgkhl26mNCNNJd3ifh46QkCxH2cLgOiYrq2fzGI_CIAgPedHsCSRCBCJR.A9QobIPbYIKTUepx2b
 9NEoDaq8c2EBUA3_SQsOU4SFDtvkREnQ4S5km3n6P8XHEgosm5ElHGSMq7hCXF6v7CW2ESUMpuGV
 kqyif8dqRE8x2kXdMZl4unuwbhGdQxYyMjWeleyaDZ75r.J9sq.70lsmOeAsTJlJk7bTqWvAns5j
 9N3jGik3y_WrUhae2XxGtXPdwfspZN07uA8BrhekX1GU9CrdMY5bexy_y0bflZmRczNgzVOuxkEd
 N.JRSeGCb0bXiqurRm7wx0ukYjWlSSrITGsjSX4DiB8iNVbwY7s.8mrH0A9qXB1zuGpr3aFqKER_
 YsAXJ3Dub.E36nnjS01zDrGsXR8iyer5Lo39Wlr6IQxmxQkScTB8CP.G8xlCHJK7foJJZkrm2ITG
 k5EsS2oKD1n_jGS2fMv.HmDboZqQzb3EbOMSBeLTUcbTLoZsxAFFzz8W7.FJKHvxoocaPs6Mm..J
 1NWrMNKhhSsALI1rgzQI4YVkCAOesI21bAt5LIw7qDpQbKjheooVsnGc7.ZQ2zk9FgJwP841XowD
 LHYXSgzJB.fPth.0GIf8VY8h.DzdmdVSRwJuE0RbY9hcPAep2EFO4hPDKdkG4N1n049FAKQTNIHE
 _mOkgno3yu7MdYLZ9Vafa_p1Aurny4ey2tihyVujaKTKUJWySHsgvJh9vuUPUIMEcx7tGGiDRmsm
 L9qDppwVWYk64CutoaIO4W8BSJRbkD7DNVyUTYGIWLmLtsye8mYBTr4Qpm1kktuQn6ntqNDW1tX.
 aPEk22pkRLczeUR0LLCuK7xguidMOmuwyom39hoQr93cFpQg6RnB7b0fC9Wz.1aAoJA.lXOGAdKp
 MDqq0k6h8JCoXYC8oY.k.oFiKzPhaqG2akyD2NZoeddH0QwuMRDKM5YBJrTupWtdU64rWwl0ev4l
 5EySje8tQ.6JwdR1rEeXav9YhHq1DndSBnHS_sFLl5Fvyo1hp1ij6dpHltSamh1sdGwF3p8LD9UX
 VrcCEKAOFcLIpnQO24mVN9VlR8DHuN6orecrrTDxPZ4EhtMyZ9u4_vKTPzso_wgzUmX25PAbhxrn
 gkr3yR0Oqrv8fyOxKXqTpr7jmeGB7HY5xi0llqq892PQWtSG24g.sM4pn8qomh5awh_UkBYqUr7n
 FJmTPO5ygl39LKxOBgO.8AUELQZXuDED7yCozPTL2o1vp0IXWH9zJzHOGpPD.drvVlQbGhBR4BU3
 teZ.UGUYmCT12Ai1SlvovfEPawwJl5DTGxSZRfuuiLZJWayFO0W6s_F2sl8W3LOXd1i_XbEx6VIt
 X_nSzWMDPuzwpnqGbweg_fQq2gWezXFsxqNm0mY_LEu.UyjbmCbDQDSh8uph0Ui6fC19B9UC89ns
 4_q6PUJxpnkDn0OHDZmaOJ0Yj0cF4AYaUga8QttzcCcBp2azGw3jkZC8u12c5phBZnzfeiAJKJqM
 Ul8H2Qezo2QN888BOZF1CqhlltfHFAECwvsGWOOj44Mff71H6inqBAI9zrdqeW3PMsPYyqRdbWDb
 WHWVZyM88odTnXedhvC8uaAUN_knRzbg5qveYAtspLDjA5dcotfI9tvJn6HonYV1iC.ewiopqRA7
 ..oT.N.99eAxxayy0qggE8iAYwCuBOXcZxAUmUT517W8cWADDOtUUT8Y4VDJkg36s_Dw5Y8WFSil
 7PwsD5GVd2R.ojPy.fm1DL5PAP6IwySw0Mt3Y7tEI0d5jJkuVcSzM5RTPW41d50dZMcXHFrNrpy.
 mIB0rKUB18MHUyqQ3AivrRQuJHxz2Xk9Sdg4XHmozlxE9hF9BLUf6t.tIRDxEYAxYgW27qPjrQ5U
 Wd63CeBd70IjSp8Z38CmiuAYOOTg3usrE8MkoGDmdiunuNm45dx6jzp_7uN81VcYaKd.M8oI7igV
 UwfUmmtRbZb3tSSFtYZxWHAz1rojkTe5HxGVL1nLpWtn12nKKt6OFbKSPaJtvJCD2kn3cWdxXz.D
 9ODnAeiXLD.YGqz7ntz8UGXx6K.yjOTZT7MEg8Uk22BDRSeQvNVgJa_SgAcfpqZERieIhgSddOJx
 LSqt7JB01NQ--
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: b51fecd6-b267-4256-b431-c807c318f436
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Tue, 24 Oct 2023 15:30:08 +0000
Received: by hermes--production-ne1-68668bc7f7-tcb7m (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5fc5461d31a49f2849dcb731ecf23d84; 
 Tue, 24 Oct 2023 15:30:03 +0000 (UTC)
Message-ID: <b307ec62-7cfd-4a58-88ef-ea549c64e75e@schaufler-ca.com>
Date: Tue, 24 Oct 2023 08:30:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] vduse: Add LSM hooks to check Virtio device type
Content-Language: en-US
To: Maxime Coquelin <maxime.coquelin@redhat.com>, mst@redhat.com,
 jasowang@redhat.com, xuanzhuo@linux.alibaba.com, paul@paul-moore.com,
 jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com,
 eparis@parisplace.org, xieyongji@bytedance.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 david.marchand@redhat.com, lulu@redhat.com,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20231020155819.24000-1-maxime.coquelin@redhat.com>
 <20231020155819.24000-5-maxime.coquelin@redhat.com>
 <c8f189e6-c79b-429a-ab36-2193bb68e3e9@schaufler-ca.com>
 <923f87a1-1871-479e-832e-db67b5ae87fd@redhat.com>
 <64626db9-e37a-4c65-a455-fc3985382216@schaufler-ca.com>
 <7524dee3-7c48-4864-8182-1b166b0f6faa@redhat.com>
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <7524dee3-7c48-4864-8182-1b166b0f6faa@redhat.com>
X-Mailer: WebService/1.1.21797
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 10/24/2023 2:49 AM, Maxime Coquelin wrote:
>
>
> On 10/23/23 17:13, Casey Schaufler wrote:
>> On 10/23/2023 12:28 AM, Maxime Coquelin wrote:
>>>
>>>
>>> On 10/21/23 00:20, Casey Schaufler wrote:
>>>> On 10/20/2023 8:58 AM, Maxime Coquelin wrote:
>>>>> This patch introduces LSM hooks for devices creation,
>>>>> destruction and opening operations, checking the
>>>>> application is allowed to perform these operations for
>>>>> the Virtio device type.
>>>>
>>>> Why do you think that there needs to be a special LSM check for virtio
>>>> devices? What can't existing device attributes be used?
>>>
>>> Michael asked for a way for SELinux to allow/prevent the creation of
>>> some types of devices [0].
>>>
>>> A device is created using ioctl() on VDUSE control chardev. Its type is
>>> specified via a field in the structure passed in argument.
>>>
>>> I didn't see other way than adding dedicated LSM hooks to achieve this,
>>> but it is possible that their is a better way to do it?
>>
>> At the very least the hook should be made more general, and I'd have to
>> see a proposal before commenting on that. security_dev_destroy(dev)
>> might
>> be a better approach. If there's reason to control destruction of vduse
>> devices it's reasonable to assume that there are other devices with the
>> same or similar properties.
>
> VDUSE is different from other devices as the device is actually
> implemented by the user-space application, so this is very specific in
> my opinion.

This is hardly unique. If you're implementing the device
in user-space you may well be able to implement the desired
controls there.

>
>>
>> Since SELinux is your target use case, can you explain why you can't
>> create SELinux policy to enforce the restrictions you're after? I
>> believe
>> (but can be proven wrong, of course) that SELinux has mechanism for
>> dealing
>> with controls on ioctls.
>>
>
> I am not aware of such mechanism to deal with ioctl(), if you have a
> pointer that would be welcome.

security/selinux/hooks.c

>
> Thanks,
> Maxime
>
>>
>>>
>>> Thanks,
>>> Maxime
>>>
>>> [0]:
>>> https://lore.kernel.org/all/20230829130430-mutt-send-email-mst@kernel.org/
>>>
>>>
>>
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
